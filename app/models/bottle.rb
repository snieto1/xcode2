class Bottle < ApplicationRecord
  belongs_to :club
  has_many :reservation_bottles
  has_many :reservations, through: :reservation_bottles
end
