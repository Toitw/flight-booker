class BookingsController < ApplicationController
    def new
      @flight = Flight.find(params[:flight_id])
      @num_passengers = params[:num_passengers].to_i
      @booking = Booking.new(flight_id: @flight.id)
      @num_passengers.times { @booking.passengers.build }
    end
  
    def create
      respond_to do |format|  
        @booking = Booking.new(booking_params)
        @flight = Flight.find(params[:booking][:flight_id])

          if @booking.save
            @booking.passengers.each do |passenger|
              PassengerMailer.with(passenger: passenger).welcome_email.deliver_later
              format.html { redirect_to booking_path(@booking), notice: 'Booking was successfully created.' }
              format.json { render :show, status: :created, location: @booking }
            end
          else
              format.html { render action: 'new' }
              format.json { render json: @booking.errors, status: :unprocessable_entity }
          end
      end
    end

    def show
        @booking = Booking.find(params[:id])
    end
  
    private
  
    def booking_params
      params.require(:booking).permit(:flight_id, :num_passengers, passengers_attributes: [:name, :email])
    end
end
  
