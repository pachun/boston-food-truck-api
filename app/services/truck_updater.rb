require "open-uri"

class TruckUpdater
  NUMBER_OF_HEADER_ROWS = 3

  def self.trucks
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
    food_trucks << {
      name: html_columns[1].children.children.to_s,
      day: html_columns[2].children.first.to_s,
      time: html_columns[3].children.first.to_s,
      location: html_columns[4].children.last.to_s,
    }
  end
end
