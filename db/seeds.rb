# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#Populate the database with some data: Airport codes
Airport.create(code: "SFO")
Airport.create(code: "NYC")
Airport.create(code: "LAX")
Airport.create(code: "MIA")
Airport.create(code: "ATL")
Airport.create(code: "ORD")
Airport.create(code: "DFW")
Airport.create(code: "DEN")
Airport.create(code: "LAS")
Airport.create(code: "PHX")
Airport.create(code: "CLT")
Airport.create(code: "SEA")
Airport.create(code: "IAH")
Airport.create(code: "MCO")


start_date = Date.today
end_date = Date.today + 1.month

Flight.delete_all

departure_airports = Airport.limit(5) # Select a smaller number of departure airports

available_dates = []

departure_airports.each do |departure_airport|
  Airport.where.not(id: departure_airport.id).limit(5).each do |arrival_airport| # Select a smaller number of arrival airports excluding the departure airport
    (start_date..end_date).each do |date|
      departure_time = DateTime.new(date.year, date.month, date.day, rand(0..23), rand(0..59))

      flight = Flight.create(departure_airport: departure_airport, arrival_airport: arrival_airport, start: departure_time)
      available_dates << flight.start.to_date unless available_dates.include?(flight.start.to_date)
    end
  end
end

