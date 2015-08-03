class FoodTrucksController < ApplicationController
  def index
    render json: FoodTruckUpdater.food_trucks
  end
end
