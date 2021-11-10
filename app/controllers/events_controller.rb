class EventsController < ApplicationController
  def index
    # @events = Hash.new()
    # for event in Event.all
    #   if @events.keys.include?(event.title) == false
    #     @events[event.title] = []
    #   end
    #   @events[event.title].append(event)
      # puts(event.inspect)
      # puts(Event.column_names.inspect)
    # end
  end
  
  def import_new_spreadsheet
    if !params[:file]
      redirect_to root_path and return
    end
    event = Event.import(params[:file])
    puts(event.title)
    redirect_to event_path(event)
  end
  
  def open_existed_spreadsheet
    $event_pic = $event_pic.to_s
    event = Event.find_by(title: params[:event_title])
    if !event
      flash[:notice] = "Cannot find the event #{params[:event_title]}."
      redirect_to root_path and return
    end
    # puts(event.title)
    redirect_to event_path(event)
  end
  
  def show
    @event = Event.find(params[:id])
    #@event_pic = "https://www.lavendascloset.com/wp-content/uploads/2016/10/FashionNXT-103.jpg"
    $event_pic = $event_pic.to_s
    @guests = @event.guests
    @guest_params = Guest.column_names
    fixed_params = ['id', 'event_id', 'booking_status', 'total_booked_num']
    fixed_params.each do |fixed_param|
      @guest_params.delete(fixed_param)
    end
    # puts(@guest_params)
    @customers = @event.box_office_customers.split('#row#').map{|row| row.split('#cell#')}
    
    @event.total_seats_guest = 0
    for guest in @guests
      @event.total_seats_guest += guest.total_booked_num
    end
    @event.balance = @event.total_seats - @event.total_seats_box_office - @event.total_seats_guest
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

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      flash[:notice] = "Failed to update the event information."
      redirect_to @event
    end
  end
  
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
