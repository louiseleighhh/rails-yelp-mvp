class RestaurantsController < ApplicationController
  # index, show, new, create
  before_action :find_restaurant, only: %i[show edit update]
  def index
    @restaurants = Restaurant.all
  end

  def show
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
