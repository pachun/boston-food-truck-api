require "open-uri"

class FoodTruckUpdater
  NUMBER_OF_HEADER_ROWS = 3

  def self.food_trucks
    food_trucks = []
    food_truck_table_html.xpath("//tr").each_with_index do |row, pos|
      next unless pos > NUMBER_OF_HEADER_ROWS
      html_columns = row.search("td")
      add_truck(food_trucks, html_columns)
    end
    food_trucks
  end

  private

  def self.food_truck_page_html
    food_truck_page = open("http://www.cityofboston.gov/foodtrucks/schedule-app-min.asp")
    Nokogiri::HTML(food_truck_page)
  end

  def self.food_truck_table_html
    food_truck_page_html.css("#tableFoodTrucks")
  end

  def self.add_truck(food_trucks, html_columns)
    food_trucks << {}.tap do |food_truck|
      set_name(food_truck, html_columns)
      set_day(food_truck, html_columns)
      set_time(food_truck, html_columns)
      set_location(food_truck, html_columns)
      food_truck[:coordinates] = CoordinateService.for_location(food_truck[:location])
    end
  end

  def self.set_name(food_truck, html_columns)
    food_truck[:name] = html_columns[1].children.children.to_s
  end

  def self.set_day(food_truck, html_columns)
    food_truck[:day] = html_columns[2].children.first.to_s
  end

  def self.set_time(food_truck, html_columns)
    food_truck[:time] = html_columns[3].children.first.to_s
  end

  def self.set_location(food_truck, html_columns)
    food_truck[:location] = html_columns[4].children.last.to_s
  end
end
