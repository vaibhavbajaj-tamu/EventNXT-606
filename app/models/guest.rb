class Guest < ActiveRecord::Base
    belongs_to :event
    
    # validates :first_name, presence: true
    # validates :last_name, presence: true
    # validates :email_address, presence: true#, length: { minimum: 5 }
    def self.find_by_email(email)
        return self.where(email_address: email)
    end
end
