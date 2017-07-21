require 'dry-struct'

module Command
  class AddPointsForPlayer < Dry::Struct
    include Dry::Types.module

    attribute :competition_id, Strict::String
    attribute :player_id, Strict::String
    attribute :points, Coercible::Int

    alias :aggregate_id :competition_id
  end
end
