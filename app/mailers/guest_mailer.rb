class GuestMailer < ApplicationMailer
    
    def rsvp_invitation_email(event, guest)
        # @event = params[:event]
        # @guest = params[:guest]
        # mail(to: @guest.email_address, subject: "#{@event.title} - Invitation")
	    RestClient.post "https://api:4199d9416da271a9dfb63f66d0a349ed-10eedde5-b0feb88b"\
		    "@api.mailgun.net/v3/sandbox4460b599dfa2462aad5cfc469caa845c.mailgun.org/messages",
		    :from => "Mailgun Sandbox <postmaster@sandbox4460b599dfa2462aad5cfc469caa845c.mailgun.org>",
		    :to => "Leon Lin <leon990x@gmail.com>",
		    :subject => "Hello Leon Lin",
		    :text => "Congratulations Leon Lin, you just sent an email with Mailgun!  You are truly awesome!"

    end
    
    
    def rsvp_confirmation_email(event, guest)
        @event = event
        @guest = guest
        mail(to: @guest.email_address, subject: "#{@event.title} - Seating Confirmation")
    end

end
