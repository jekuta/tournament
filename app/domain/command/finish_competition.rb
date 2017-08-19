require 'dry-struct'

module Command
  class FinishCompetition < Dry::Struct
    include Dry::Types.module

    attribute :competition_id, Strict::String

    alias :aggregate_id :competition_id
  end
end
