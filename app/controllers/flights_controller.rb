class FlightsController < ApplicationController
    def index
      @available_dates = Flight.pluck(:start).map(&:to_date).uniq
      @flight = Flight.new

      if params[:flight].present?
        flight_params = flight_form_params
        departure_airport_id = flight_params[:departure_airport_id]
        arrival_airport_id = flight_params[:arrival_airport_id]
  
        if departure_airport_id.present? && arrival_airport_id.present?
          @available_flights = Flight.where(departure_airport_id: departure_airport_id, arrival_airport_id: arrival_airport_id)
        else
          @available_flights = []
        end
      else
        @available_flights = []
      end
    end
  
    private
  
    def flight_form_params
      params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :num_passengers, :departure_date)
    end
  end
  
  


