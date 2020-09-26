class Game < ApplicationRecord
  has_many :requirements
  has_many :news
  has_many :game_modes
  has_many :modes, through: :game_modes
  has_many :game_platforms
  has_many :platforms, through: :game_platforms
end
