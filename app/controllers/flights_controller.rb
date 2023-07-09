class FlightsController < ApplicationController
    def index
      @available_dates = Flight.pluck(:start).map(&:to_date).uniq
  
      if params[:flight].present?
        departure_airport_id = params[:flight][:departure_airport_id]
        arrival_airport_id = params[:flight][:arrival_airport_id]
  
        if departure_airport_id.present? && arrival_airport_id.present?
          @available_flights = Flight.where(departure_airport_id: departure_airport_id, arrival_airport_id: arrival_airport_id)
        else
          @available_flights = []
        end
      else
        @available_flights = []
      end
    end
  end
  


