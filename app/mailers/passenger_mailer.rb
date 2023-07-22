class PassengerMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def welcome_email
        @booking = params[:booking]
        @url = 'http://example.com/login'
        @booking.passengers.each do |passenger|
            @passenger = passenger # Set @passenger for each iteration
            mail(to: @passenger.email, subject: 'Welcome to My Awesome Site')
        end
    end
end
