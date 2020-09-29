class Mode < ApplicationRecord
  has_many :games, through: :game_modes
  has_many :game_modes

  validates :name, :maximum_players, presence: true
end
