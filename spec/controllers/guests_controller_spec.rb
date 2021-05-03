require 'rails_helper'

RSpec.describe GuestsController, type: :controller do
    describe 'sending email invitation' do
        let(:event) {Event.create :id => 1, :title => 'fake_title', :date => 'fake_date', :box_office_customers => ''}
        let(:guest) {Guest.create :id => 1, :event_id => event.id, :first_name => 'fake_first_name_1', :last_name => 'fake_last_name_1', :email_address => 'name@gmail.com',
            :booking_status => 'Not invited', :total_booked_num => 0}
            
#         it 'should call the GuestMailer method that sends rsvp invitation email' do
#             expect(GuestMailer).to receive(:rsvp_invitation_email).with(event, guest)
# 			get :send_email_invitation, {:event_id => event.id, :id => guest.id}
# 		end
		
        it 'should update the booking status with the successfully sending confirmation' do
			get :send_email_invitation, {:event_id => event.id, :id => guest.id}
			updated_guest = Guest.find(guest.id)
			expect(updated_guest.booking_status).to eq 'Invited'
			expect(updated_guest.total_booked_num).to eq 0
			expect(flash[:notice]).to eq "The email was successfully sent to #{guest.first_name} #{guest.last_name}."
			expect(response).to redirect_to(event_path(event))
		end
	end
	
	describe 'receiving email confirmation' do
        let(:event) {Event.create :id => 1, :title => 'fake_title', :date => 'fake_date', :box_office_customers => ''}
        let(:guest) {Guest.create :id => 1, :event_id => event.id, :first_name => 'fake_first_name_1', :last_name => 'fake_last_name_1', :email_address => 'name@gmail.com',
            :booking_status => 'Invited', :total_booked_num => 0}
		
		context 'with valid selection' do
            it 'should update the booking status and the total booked number with the successfully submitting confirmation' do
    			post :update, {:event_id => event.id, :id => guest.id, :guest => {:booking_status => 'Yes', :total_booked_num => 1}}
    			updated_guest = Guest.find(guest.id)
    			expect(updated_guest.booking_status).to eq 'Yes'
    			expect(updated_guest.total_booked_num).to eq 1
    			expect(response).to render_template('guests/success_confirmation')
    		end
		end
		
		context 'with invalid selection' do
		    it 'should failed to update the guest information and display the warning message with the edit template' do
    			post :update, {:event_id => event.id, :id => guest.id, :guest => {:booking_status => 'Yes', :total_booked_num => 0}}
    			updated_guest = Guest.find(guest.id)
    			expect(updated_guest.booking_status).to eq 'Invited'
    			expect(updated_guest.total_booked_num).to eq 0
    			expect(response).to redirect_to edit_event_guest_path(event, guest)
    		end
		end
	end
	
end



