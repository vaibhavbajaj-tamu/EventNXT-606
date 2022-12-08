class GuestMailer < ApplicationMailer
    
    def rsvp_invitation_email(event, guest)
        @event = event
        @guest = guest
        mail(to: @guest.email, subject: "#{@event.title} - Invitation")
    end
    
   def referral_email(event, guest)
        @event = event
        @guest = guest
        mail(to: @guest.email, subject: "#{@event.title} - Invitation")
   end
    
   def purchase_tickets_email(referral_email, event, guest)
        @event=event
        @guest = guest
        mail(to: referral_email, subject: "Purchase Tickets")
   end
    
   def rsvp_confirmation_email(event, guest)
        @event = event
        @guest = guest
        mail(to: @guest.email, subject: "#{@event.title} - Seating Confirmation")
   end

end
