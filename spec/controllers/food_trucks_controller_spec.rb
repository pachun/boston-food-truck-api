require "rails_helper"
require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end

describe FoodTrucksController do
  describe "GET index" do
    it "returns a json representation of all the food trucks" do
      VCR.use_cassette("food_truck_schedule_html") do
        boston_dot_gov_page = URI("http://www.cityofboston.gov/foodtrucks/schedule-app-min.asp")
        Net::HTTP.get_response(boston_dot_gov_page)
        get :index
        received_json = JSON.parse(response.body)
        food_truck_json = JSON.parse(File.read("fixtures/food_trucks.json"))

        expect(received_json).to eq(food_truck_json)
      end
    end
  end
end
