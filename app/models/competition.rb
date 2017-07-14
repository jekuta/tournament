class Competition < ApplicationRecord
  has_many :participations
  has_many :competitors, through: :participations
end
