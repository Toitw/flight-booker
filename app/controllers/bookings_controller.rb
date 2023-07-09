class BookingsController < ApplicationController
    def new
      @flight = Flight.find(params[:flight_id])
      @num_passengers = params[:num_passengers].to_i
      @booking = Booking.new(flight_id: @flight.id)
      @num_passengers.times { @booking.passengers.build }
    end
  
    def create
      @booking = Booking.new(booking_params)
      @flight = Flight.find(params[:booking][:flight_id])
  
      if @booking.save
        # Successful booking creation logic
        redirect_to booking_path(@booking)
      else
        # Handle validation errors
        render :new
      end
    end

    def show
        @booking = Booking.find(params[:id])
    end
  
    private
  
    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
    end
  end
  
