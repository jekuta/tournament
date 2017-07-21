module Entities
  class Player
    attr_reader :id, :name, :points

    def initialize(id:, name:)
      @id = id
      @name = name
      @points = 0
    end

    def add_points(points)
      @points += points
    end
  end
end
