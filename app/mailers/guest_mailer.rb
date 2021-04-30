class GuestMailer < ApplicationMailer
    
    def rsvp_invitation_email(event, guest)
        @event = event
        @guest = guest
        mail(to: @guest.email_address, subject: "#{@event.title} - Invitation")
    end
    
    def rsvp_confirmation_email(event, guest)
        @event = event
        @guest = guest
        mail(to: @guest.email_address, subject: "#{@event.title} - Seating Confirmation")
    end

end
