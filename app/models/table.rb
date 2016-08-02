class Table < ApplicationRecord
  belongs_to :club
  has_one :reservation
end
