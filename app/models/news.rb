class News < ApplicationRecord
  belongs_to :game
  has_many :comments
  belongs_to :user
end
