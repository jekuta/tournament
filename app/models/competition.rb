class Competition < ApplicationRecord
  has_many :participations
  has_many :competitors, through: :participations

  validates :uid, presence: true, uniqueness: true
  validates :state, presence: true

  enum state: { created: 0, started: 1 }
end
