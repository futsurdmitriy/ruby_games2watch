class News < ApplicationRecord
  belongs_to :game
  has_many :comments
end
