require 'factory_girl_rails'

module UserAuthHelper

  def self.create_user_with_token
    user = FactoryGirl.create(:user)
    return user, jwt_token(user)
  end

  def self.jwt_token(resource, remember = false)
    return nil unless resource
    payload = {
        exp: (Time.now + (remember ? JwtAuthentication.jwt_timeout_remember_me : JwtAuthentication.jwt_timeout)).to_i,
        user: {
            email: resource.email,
            id: resource.id
        }
    }
    JWT.encode(payload, resource.authentication_token)
  end

end
