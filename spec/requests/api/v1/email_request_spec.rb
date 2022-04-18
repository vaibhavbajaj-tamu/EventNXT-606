require 'rails_helper'

RSpec.describe "Api::V1::EmailController", type: :request do
  let!(:user) { create :user }
  let!(:event) { create :event }
  let!(:guest_list) { create_list :guest, 3, event: event }

  describe "POST /api/v1/email" do
    context "there are users that want to email guests" do
      let!(:senders) { create_list :user, 3 }
      it "should get a successful response" do
        sender_ids = senders.map { |sender| sender.id }
        guest_ids = guest_list.map { |guest| guest.id }
        p = {senders: sender_ids, recipients: guest_ids,
             subject: Faker::Lorem.sentence, body: Faker::Lorem.paragraph}
        post "/api/v1/email", params: p
        expect(response).to be_successful
      end
    end

    context "there are users that want to email guests with a template" do
      let!(:senders) { create_list :user, 3 }
      let!(:template) { create :email_template }
      it "should get a successful response" do
        sender_ids = senders.map { |sender| sender.id }
        guest_ids = guest_list.map { |guest| guest.id }
        p = {senders: sender_ids, recipients: guest_ids, template_id: template.id}
        post "/api/v1/email", params: p
        expect(response).to be_successful
      end
    end
  end
end
