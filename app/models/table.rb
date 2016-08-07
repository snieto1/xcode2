class Table < ApplicationRecord
  belongs_to :club
  has_one :reservation

  # Validates Table Name
  validates :table_name, presence: true, length: { maximum: 30 }
  #
  # # Validates Minimum as String
  validates :minimum, presence: true, length: { maximum: 15 }

  # Validates Minimum as Int
  # validates :minimum, presence: true, numericality: { only_integer: true }

end
