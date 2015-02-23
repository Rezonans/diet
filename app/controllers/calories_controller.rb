class CaloriesController < ApplicationController
  acts_as_jwt_authentication_handler
  load_and_authorize_resource :meal, through: :current_user, parent: false

  def index
    calories = @meals.time_filter(filter_params[:date], :date)
                     .time_filter(filter_params[:time], :time)
                     .calories_statistic
    render json: calories
  end

  private

  def filter_params
    params.permit({date: [:from, :to]}, {time: [:from, :to]})
  end

end
