class Api::V1::EventsController < Api::V1::ApiController
  def index
  end
  
  def show
  end

  def create
    p = event_params
    p[:last_modified] = Time.new
    event = Event.create(p)
    render_valid(event)
  end

  def update
    event = Event.find params[:id]
    event.update(event_params)
    render_valid(event)
  end

  def destroy
    event = Event.find params[:id]
    event.destroy
  end

  private
  def event_params
    params.permit(:title, :address, :datetime, :description,
        :image, :box_office, :x1, :y1, :x2, :y2)
  end

  def render_valid(event)
    if event.valid?
      event.image.attach(params[:image]) if params[:image].present?
      event.box_office.attach(params[:image]) if params[:box_office].present?
      head :ok
    else
      render json: {errors: event.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
