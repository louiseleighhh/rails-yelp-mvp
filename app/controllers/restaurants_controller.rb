class RestaurantsController < ApplicationController
  # index, show, new, create
  before_action :find_task, only: %i[show edit update]
  def index
    @restaurants = Restaurant.all
  end

  def show; end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to task_path(@restaurant)
  end
end
