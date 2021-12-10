class Guest < ApplicationRecord
    belongs_to :event
    
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email_address, presence: true
end