class ReservationBottle < ApplicationRecord
  belongs_to :reservation
  belongs_to :bottle
end
