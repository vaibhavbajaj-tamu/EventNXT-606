class GuestsController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @guests = @event.guests
  end
  
  def show
    @event = Event.find(params[:event_id])
    @guest = Guest.find(params[:id])
  end
  
  def new
    @event = Event.find(params[:event_id])
  end
    
  def create
    @event = Event.find(params[:event_id])
    guest = @event.guests.create(guest_params)
    # @event.total_seats_guest = @event.guests.count()
    # @event.balance = @event.total_seats - @event.total_seats_box_office - @event.total_seats_guest
    redirect_to event_guests_path(@event)
  end
  
  def edit
    @event = Event.find(params[:event_id])
    @guest = Guest.find(params[:id])
  end

  def update
    @event = Event.find(params[:event_id])
    @guest = Guest.find(params[:id])

    if @guest.update(guest_params)
      redirect_to event_guest_path(@event, @guest)
    else
      render :edit
    end
  end
  
  def destroy
    @event = Event.find(params[:event_id])
    @guest = @event.guests.find(params[:id])
    @guest.destroy
    redirect_to event_guests_path(@event)
  end
  
  private
    def guest_params
      params.require(:guest).permit(:name, :email_address)
    end
end
