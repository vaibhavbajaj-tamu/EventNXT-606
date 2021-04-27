class GuestMailer < ApplicationMailer
    
    def confirmation_email(guest)
        @guest = guest
        email = @guest.email_address
        maxtic = @guest.max_seats_num.to_s
        @url = 'localhost:3000/forms/submit?email='+email+'&maxtic='+maxtic
        mail(to: @guest.email_address, subject: 'Welcome to My Awesome Site')
    end
end
