class News < ApplicationRecord
  belongs_to :author
  belongs_to :game
end
