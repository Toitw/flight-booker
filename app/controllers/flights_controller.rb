class FlightsController < ApplicationController
    def index
        @flights = Flight.all
        @available_dates = []
        if params[:departure_airport_id] && params[:arrival_airport_id]
        @available_dates = Flight.available_dates(params[:departure_airport_id], params[:arrival_airport_id])
        end
    end
end
