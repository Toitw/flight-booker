class FlightsController < ApplicationController
    def index
      @flights = Flight.all
      @available_dates = Flight.pluck(:start).map(&:to_date).uniq
      if params[:departure_date]
        @flights = @flights.where(start: params[:departure_date].to_date.beginning_of_day..params[:departure_date].to_date.end_of_day)
      end
    end
  end


