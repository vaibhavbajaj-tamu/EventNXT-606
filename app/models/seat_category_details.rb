class SeatCategoryDetails < ActiveRecord::Base
    validates :event_title, presence: true
    validates :total_seats, presence: true
    validates :vip_seats, presence: true
    validates :non_vip_seats, presence: true
    validates :balance, presence: true
    validates :seat_category, presence: true
end
