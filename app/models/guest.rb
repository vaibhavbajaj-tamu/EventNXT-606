class Guest < ActiveRecord::Base
    belongs_to :event
    
    validates :name, presence: true
    validates :email_address, presence: true#, length: { minimum: 5 }
end
