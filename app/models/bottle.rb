class Bottle < ApplicationRecord
  belongs_to :club
  has_many :reservation_bottles
  has_many :reservations, through: :reservation_bottles

  # Validates Bottle Name
  validates: :name, presence: true, length: {maximum: 35}

  # Validates Bottle Price
  validates: :price, presence: true, numericality: { only_integer: true}
end
