require "open-uri"

class TruckUpdater
  def self.trucks
    food_truck_html = Nokogiri::HTML(open("http://www.cityofboston.gov/foodtrucks/schedule-app-min.asp"))

    food_truck_table = food_truck_html.css("#tableFoodTrucks")

    food_trucks = []
    food_truck_table.xpath("//tr").each_with_index do |row, pos|
      next unless pos > 3
      cols = row.search("td")

      food_trucks << {
        name: cols[1].children.children.to_s,
        day: cols[2].children.first.to_s,
        time: cols[3].children.first.to_s,
        location: cols[4].children.last.to_s,
      }
    end

    food_trucks
  end
end
