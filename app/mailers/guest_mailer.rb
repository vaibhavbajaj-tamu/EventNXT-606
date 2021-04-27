class GuestMailer < ApplicationMailer
    
    def confirmation_email(guest)
        @guest = guest
        email = @guest.email_address
        maxtic = @guest.max_seats_num.to_s
        @url = 'https://morning-lake-37538.herokuapp.com/forms/submit?email='+email+'&maxtic='+maxtic
        mail(to: @guest.email_address, subject: 'Welcome to My Awesome Site')
    end
    
    def rsvp_confirmation_email(email, number)
        @email = email
        @number = number
        mail(to: 'evelynnngao@gmail.com', subject: 'Congratulation on signing up the RSVP form')
    end
end
