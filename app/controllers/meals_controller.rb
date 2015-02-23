class MealsController < ApplicationController
  acts_as_jwt_authentication_handler

  before_action :set_meal, only: [:show, :update, :destroy]

  def index
    @meals = Meal.by_user(filter_params[:user_id])
    @meals = @meals.time_filter(filter_params[:date], :date).
                    time_filter(filter_params[:time], :time)

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
    head :no_content
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:name, :time, :calories)
  end
  def filter_params
    params.permit({date: [:from, :to]}, {time: [:from, :to]}, :user_id)
  end
end
