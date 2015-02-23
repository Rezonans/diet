class UsersController < ApplicationController
  acts_as_jwt_authentication_handler

  before_action :set_user, only: [:show, :update]

  def show
    render_resource_or_errors(@user)
  end

  def update
    @user.update(user_params)
    render_resource_or_errors(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:daily_calories_limit)
  end

end
