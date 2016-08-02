class Club < ApplicationRecord
  has_many :tables
  has_many :bottles

  before_save { self.club_email = club_email.downcase }

  validates :club_name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :club_email, presence: true, format: { with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  has_secure_password
end
