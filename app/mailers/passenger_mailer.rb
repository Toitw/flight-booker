class PassengerMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def welcome_email
        @passenger = params[:passenger]
        @url = 'http://example.com/login'
        mail(to: @passenger.email, subject: 'Welcome to FlightBooker.com')
    end
end
