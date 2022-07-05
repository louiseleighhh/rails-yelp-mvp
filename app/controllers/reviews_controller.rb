class ReviewsController < ApplicationController
  before_action :find_restaurant, except: [:destroy]

  def new
    @review = Revie.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
