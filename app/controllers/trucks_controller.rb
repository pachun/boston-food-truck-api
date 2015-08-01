class TrucksController < ApplicationController
  def index
    render json: TruckUpdater.trucks
  end
end
