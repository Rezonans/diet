require 'helpers/user_auth_helper'
module ControllerMacros
  def login_user(type = :each)
    before(type) do
      @user, token = UserAuthHelper.create_user_with_token
      @user_token = token
    end
  end
end
