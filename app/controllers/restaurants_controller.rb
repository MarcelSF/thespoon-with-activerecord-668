class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    #create a new restaurant based on the params!
    @restaurant = Restaurant.new(restaurant_params)
    #save the restaurant
    @restaurant.save
    redirect_to restaurants_path
  end

  def edit
  end

  def update
    # Find the restaurant we want to update on the DB
    # Update and save the restaurant
    @restaurant.update(restaurant_params)
    # Redirect the user to the show page
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    # Find the restaurant
    # Destroy the restaurant
    @restaurant.destroy
    # Redirect the user
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
