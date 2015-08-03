class FoodTrucksController < ApplicationController
  def index
    render json: TruckUpdater.trucks
  end
end
