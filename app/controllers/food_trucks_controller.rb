class FoodTrucksController < ApplicationController
  def index
    render json: FoodTruckUpdater.todays_food_trucks
  end
end
