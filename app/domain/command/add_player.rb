require 'dry-struct'

module Command
  class AddPlayer < Dry::Struct
    include Dry::Types.module

    attribute :competition_id, Strict::String
    attribute :id, Strict::String
    attribute :name , Strict::String

    alias :aggregate_id :competition_id
  end
end
