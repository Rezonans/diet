class UsersController < ApplicationController
  acts_as_jwt_authentication_handler
  load_and_authorize_resource

  def show
    render_resource_or_errors(@user)
  end

  def update
    @user.update(user_params)
    render_resource_or_errors(@user)
  end

  private

  def user_params
    params.require(:resource).permit(:daily_calories_limit)
  end

end
