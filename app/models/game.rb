class Game < ApplicationRecord
  has_many :requirements
  has_many :news
  has_many :game_modes
  has_many :modes, through: :game_modes, :dependent => :destroy
  has_many :game_platforms
  has_many :platforms, through: :game_platforms, :dependent => :destroy

  validates :name, :company, :genre, :published_at,
            :critics_rate, :publisher,
            presence: true
  validates_presence_of :modes, :platforms
end
