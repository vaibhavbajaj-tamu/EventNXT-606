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
  
  def load_local_csv_file
    file = "#{Rails.root}/public/ticket_list_10-11-17.xlsx"
    Event.import(file)
    
    redirect_to root_path()
  end
  
  def show
    @event = Event.find(params[:id])
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
