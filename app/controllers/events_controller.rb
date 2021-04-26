class EventsController < ApplicationController
  def index
    @events = Hash.new()
    for event in Event.all
      if @events.keys.include?(event.title) == false
        @events[event.title] = []
      end
      @events[event.title].append(event)
      # puts(event.inspect)
      # puts(Event.column_names.inspect)
    end
  end
  
  def load_event_information
    event_title = "2017 FashioNXT Week Runway Shows"
    file = "#{Rails.root}/public/ticket_list_10-11-17.xlsx"
    Event.import(file)
    event = Event.find_by(title: event_title)
    puts(event.title)
    # file = "#{Rails.root}/public/Seat Data Report.xlsx"
    # Event.import(file)
    redirect_to event_path(event)
  end
  
  def show
    @event = Event.find(params[:id])
    @guests = @event.guests
    
    @guest_params = Guest.column_names
    fixed_params = ['id', 'event_id', 'booking_status', 'total_booked_num']
    fixed_params.each do |fixed_param|
      @guest_params.delete(fixed_param)
    end
    # puts(@guest_params)
    @customers = @event.box_office_customers.split('#row#').map{|row| row.split('#cell#')}
  end
  
  # def new
  #   @event = Event.new
  # end

  # def create
  #   @event = Event.new(event_params)

  #   if @event.save
  #     redirect_to event_path(@event)
  #   else
  #     render :new
  #   end
  # end
  
  
  # def edit
  #   @event = Event.find(params[:id])
  # end

  # def update
  #   @event = Event.find(params[:id])

  #   if @event.update(event_params)
  #     redirect_to @event
  #   else
  #     render :edit
  #   end
  # end
  
  # def destroy
  #   @event = Event.find(params[:id])
  #   @event.destroy

  #   redirect_to root_path
  # end
  
  private
    def event_params
      params.require(:event).permit(:title, :date, :total_seats, :total_seats_box_office, :total_seats_guest)
    end
      

end
