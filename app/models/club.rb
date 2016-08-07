class Club < ApplicationRecord
  has_many :tables
  has_many :bottles

  before_save :format

  # Validates club name

  validates :club_name, presence: true, length: { maximum: 25 }

  # Email and phone format
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_NUMBER_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/

  # Validates Email
  validates :club_email, presence: true, format: { with: VALID_EMAIL_REGEX, message: "Not valid email"}, uniqueness: {case_sensitive: false}

  # Validates Phone
    validates :club_phone_number, presence: true, length: { maximum: 15 }

    # Validates Password
    validates :password_digest, presence: true, length: { minimum: 7 }

  has_secure_password

  def format
    self.club_email = club_email.downcase
    # self.contact_person = contact_person.
  end

end
