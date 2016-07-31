class User < ApplicationRecord
  # Email is downcase to make it comparable
  before_save { self.email = email.downcase}

  # Makes sure a name is put in and is under 50 chars
  validates :first_name, presence: true, length: {maximum: 25}

  validates :last_name, presence: true, length: {maximum: 25}

  # Makes sure email is actually an email format
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Makes sure email is put in and in correct format
  validates :email, presence: true, length: { maximum: 255}, format: { with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false}

  has_secure_password
end
