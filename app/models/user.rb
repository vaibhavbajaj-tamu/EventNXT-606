class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :guest
  has_many :events

  validates :email, presence: true, email: true
  validates :encrypted_password, presence: true
  # todo: updated_at > created_at
  validates :created_at, presence: true
  validates :updated_at, presence: true
end
