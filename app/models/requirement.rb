class Requirement < ApplicationRecord
  belongs_to :game

  validates :req_type, :operating_system,
            :ram, :cpu, :gpu, :free_space, presence: true
end
