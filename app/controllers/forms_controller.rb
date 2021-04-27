class FormsController < ApplicationController

	def success

	end

  def submit
		@email=params[:email]
		if params[:maxtic]
			@max=params[:maxtic].to_i
		else
			@max=1
		end
		if request.post?
			params[:form]["number"] = params[:form]["number"].to_i
			#params[:form]["other"] = params[:form]["text"]
			if params[:coming] == 'yes' 
				if params[:form]["number"] == 0
					params[:form]["number"] = 1
				end
				params[:form]["resp"] = true
			elsif params[:coming] == 'no'
				if params[:form]["number"] > 0
					params[:form]["number"] = 0
				end
				params[:form]["resp"] = false
			end

			@guest = Guest.find_by_email(params[:form]["email"])
			@guest.update_all({:booking_status => params[:coming], :total_booked_num => params[:form]["number"]})
  		#render plain: params[:form].inspect
			render :template => "forms/success"
		end
  end

	private
    def guest_params
      params.require(:guest).permit(:first_name, :last_name, :event_id, :email_address, :affiliation, 
        :added_by, :guest_type, :seat_category, :max_seats_num, :booking_status, :total_booked_num)
    end

end
