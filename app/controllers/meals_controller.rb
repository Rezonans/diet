class MealsController < ApplicationController
  acts_as_jwt_authentication_handler
  load_and_authorize_resource :meal, through: :current_user

  def index
    @meals = @meals.time_filter(filter_params[:date], :date)
                   .time_filter(filter_params[:time], :time)
                   .order(:time, :id)

    render json: { resources: @meals }
  end

  def show
    render_resource_or_errors(@meal)
  end

  def create
    @meal = current_user.meals.create(meal_params)
    render_resource_or_errors(@meal)
  end

  def update
    @meal.update(meal_params)
    render_resource_or_errors(@meal)
  end

  def destroy
    @meal.destroy
    render nothing: true
  end

  private

  def meal_params
    params.require(:resource).permit(:name, :time, :calories)
  end
  def filter_params
    params.permit({date: [:from, :to]}, {time: [:from, :to]}, :user_id)
  end
end
