class User < ApplicationRecord
  has_one :reservation

  before_save :format

  # Validations First Name and Last Name
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }

  # Email and phone format
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # VALID_PHONE_NUMBER_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/

  # Validates Email
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX, message: "Not valid email" }, uniqueness: { case_sensitive: false }

  # Validates Age
  # validates :age, presence: true, numericality: { greater_than_or_equal_to: 21 }

  # Validates Phone
  validates :phone_number, presence: true, length: { maximum: 55 }

  # Validates Password
  validates :password_digest, presence: true, length: { minimum: 7 }

  has_secure_password

  def format
    self.email = email.downcase
    self.first_name = first_name.capitalize
    self.last_name = last_name.capitalize
  end
end
