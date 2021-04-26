class GuestsController < ApplicationController
  # def index
  #   @event = Event.find(params[:event_id])
  #   @guests = @event.guests
  # end
  
  def send_email_invitation
    event = Event.find(params[:event_id])
    guest = Guest.find(params[:id])
    # --- 
    GuestMailer.confirmation_email(guest).deliver
    guest.update({:booking_status => 'Invited', :total_booked_num => 0})
    redirect_to event_path(event)
  end
  
  def receive
    guest = Guest.find(params[:id])
    # --- 
    # guest.update({:booking_status => 'Yes', :total_booked_num => 1})
  end
  
  
  
  
  
  # def new
  #   @event = Event.find(params[:event_id])
  # end
    
  def create
    event = Event.find(params[:event_id])
    guest = event.guests.create!(guest_params)
    guest.update({:booking_status => 'Not invited', :total_booked_num => 0})
  
    redirect_to event_path(event)
  end
  
  # def edit
  #   @event = Event.find(params[:event_id])
  #   @guest = Guest.find(params[:id])
  # end

  def update
    event = Event.find(params[:event_id])
    guest = Guest.find(params[:id])

    if guest.update(guest_params)
      redirect_to event_path(event)
    else
      render :edit
    end
  end
  
  def destroy
    event = Event.find(params[:event_id])
    guest = event.guests.find(params[:id])
    guest.destroy
    
    # @event.total_seats_guest -= 1
    # @event.balance += 1
    # @event.update({:total_seats_guest => @event.total_seats_guest, :balance => @event.balance})
    redirect_to event_path(event)
  end
  
  # def destroy_all
  #   @event = Event.find(params[:event_id])
  #   @guests = @event.guests
  #   @guests.destroy
    
  #   # @event.total_seats_guest -= 1
  #   # @event.balance += 1
  #   # @event.update({:total_seats_guest => @event.total_seats_guest, :balance => @event.balance})
  #   redirect_to event_path(@event)
  # end
  
  private
    def guest_params
      params.require(:guest).permit(:first_name, :last_name, :event_id, :email_address, :affiliation, 
        :added_by, :guest_type, :seat_category, :max_seats_num, :booking_status, :total_booked_num)
    end
end
