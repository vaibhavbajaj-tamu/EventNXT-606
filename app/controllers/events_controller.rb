class EventsController < ApplicationController
  before_action :authenticate_user!
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
  
  def create_event
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
    event = Event.find_by(title: params[:event_title])
    
    $event_pic = params[:event_picture] #new
    $event_txt = params[:event_text] #new text
    
    if !event
      flash[:notice] = "Cannot find the event #{params[:event_title]}."
      redirect_to root_path and return
    end
    # puts(event.title)
    redirect_to event_path(event)
  end

  #Seat Categories Code //////////////////
  def seat_categories
    redirect_to root_path and return
  end
  
  class SeatWiseRows
    attr_accessor :vip_seats
    attr_accessor :non_vip_seats
    attr_accessor :seat_category
    attr_accessor :total_seats
    attr_accessor :balance
    #attr_accessor :model_name
    
    def initialize(a, b, c, d, e)
      #@model_name = 'SeatWiseRows'
      @total_seats = a
      @vip_seats = b
      @non_vip_seats = c
      @seat_category = d
      @balance = e
    end
  end
 #^Seat Categories Code //////////////////
  
  def show
    @event = Event.find(params[:id])
    #@event_pic = "https://www.lavendascloset.com/wp-content/uploads/2016/10/FashionNXT-103.jpg"
    $event_pic = $event_pic.to_s #new
    
    @guests = @event.guests
    @guest_params = Guest.column_names

    #seat category additions
    @bo_seat_wise_split = {}
    @vip_seat_wise_split = {}
    @seat_category_set = Set.new
    @total_seat_wise_split = []
    #end seat category additions

    fixed_params = ['id', 'event_id', 'booking_status', 'total_booked_num']
    fixed_params.each do |fixed_param|
      @guest_params.delete(fixed_param)
    end
    # puts(@guest_params)
    @customers = @event.box_office_customers.split('#row#').map{|row| row.split('#cell#')}
    
    #new
    @customers[1..-1].each do |row|
      @seat_category_set.add?(row[9])
      
      if @bo_seat_wise_split.keys.include?(row[9]) == true
        @bo_seat_wise_split[row[9]] += row[24].to_i
      else
        @bo_seat_wise_split[row[9]] = row[24].to_i
      end
    end
    
    @guests.each do |guest|
      puts(guest)
      @seat_category_set.add?(guest[:seat_category])
      
      if @vip_seat_wise_split.keys.include?(guest[:seat_category]) == true
        @vip_seat_wise_split[guest[:seat_category]] += guest[:max_seats_num]    #change to guest[:total_booked_num]
      else
        @vip_seat_wise_split[guest[:seat_category]] = guest[:max_seats_num]     #change to guest[:total_booked_num]
      end
    end
    
    @seat_category_set.each do |category_name|
      vip_seats = 0
      non_vip_seats = 0
      if @vip_seat_wise_split.keys.include?(category_name)
        vip_seats = @vip_seat_wise_split[category_name]
      end
      if @bo_seat_wise_split.keys.include?(category_name)
        non_vip_seats = @bo_seat_wise_split[category_name]
      end
     
      total_seats = 500
      balance = total_seats - vip_seats - non_vip_seats
      newEntry = SeatWiseRows.new(total_seats, vip_seats, non_vip_seats, category_name, balance)
      @total_seat_wise_split.append(newEntry)
    end
    #new end

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