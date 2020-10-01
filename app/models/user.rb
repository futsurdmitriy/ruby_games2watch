class User < ApplicationRecord

  ADMIN_ROLE = "admin"
  EDITOR_ROLE = "editor"
  USER_ROLE = "user"

  has_secure_password
  has_many :comments
  has_many :news

  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { :case_sensitive => false }
  validates :password, confirmation: { case_sensitive: true }
end
