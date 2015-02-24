class CaloriesController < ApplicationController
  acts_as_jwt_authentication_handler
  load_and_authorize_resource :meal, through: :current_user, parent: false

  def index
    calories = @meals.time_filter(filter_date_params, :date)
                     .time_filter(filter_time_params, :time)
                     .calories_statistic
    render json: { resources: calories }
  end

  private

  def filter_date_params
    params.permit([:date_from, :date_to]).tap do |data|
      data[:from] = data.delete(:date_from)
      data[:to] = data.delete(:date_to)
    end
  end

  def filter_time_params
    params.permit([:time_from, :time_to]).tap do |data|
      data[:from] = data.delete(:time_from)
      data[:to] = data.delete(:time_to)
    end
  end

end
