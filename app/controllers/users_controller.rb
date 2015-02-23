class UsersController < ApplicationController

  acts_as_jwt_authentication_handler

  before_action :set_user, only: [:show, :update]

  def show
    render json: @user.to_json(only: [:daily_calories_limit]), status: :ok
  end

  def update
    if @user.update(user_params)
      render json: @user.to_json(only: [:daily_calories_limit]), status: :ok
    else
      render json: {errors: @user.errors}, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:daily_calories_limit)
  end
end
