class BoxOfficeData < ApplicationRecord
    belongs_to :event
    belongs_to :user, foreign_key: :added_by
  
    has_many :guest_seat_tickets, dependent: :destroy
    has_many :seats, through: :guest_seat_tickets, dependent: :destroy
    
    validates :email, presence: true, uniqueness: { scope: :event }
   
    validates :referral_expiration, expiration: true
  
    def full_name
      "#{first_name} #{last_name}"
    end
end