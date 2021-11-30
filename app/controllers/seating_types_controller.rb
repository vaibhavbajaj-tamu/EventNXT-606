class SeatingTypesController < ApplicationController
  before_action :set_seating_type, only: %i[ show edit update destroy ]

  # GET /seating_types or /seating_types.json
  def index
    @seating_types = SeatingType.all
  end

  # GET /seating_types/1 or /seating_types/1.json
  def show
  end

  # GET /seating_types/new
  def new
    @seating_type = SeatingType.new
  end

  # GET /seating_types/1/edit
  def edit
  end

  # POST /seating_types or /seating_types.json
  def create
    @seating_type = SeatingType.new(seating_type_params)

    respond_to do |format|
      if @seating_type.save
        format.html { redirect_to @seating_type, notice: "Seating type was successfully created." }
        format.json { render :show, status: :created, location: @seating_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @seating_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seating_types/1 or /seating_types/1.json
  def update
    respond_to do |format|
      if @seating_type.update(seating_type_params)
        format.html { redirect_to @seating_type, notice: "Seating type was successfully updated." }
        format.json { render :show, status: :ok, location: @seating_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @seating_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seating_types/1 or /seating_types/1.json
  def destroy
    @seating_type.destroy
    respond_to do |format|
      format.html { redirect_to seating_types_url, notice: "Seating type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seating_type
      @seating_type = SeatingType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def seating_type_params
      params.require(:seating_type).permit(:seat_category, :total_seat_count, :vip_seat_count, :box_office_seat_count, :balance_seats, :event_id)
    end
end
