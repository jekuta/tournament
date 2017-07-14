class Competitor < ApplicationRecord
  validates :name, presence: true

  has_many :participations
  has_many :competitions, through: :participations
end
