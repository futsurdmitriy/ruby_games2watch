class User < ApplicationRecord
  has_secure_password
  has_many :comments

  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, confirmation: { case_sensitive: true }
end
