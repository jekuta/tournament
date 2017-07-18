module Aggregate
  class Competition
    attr_reader :id, :state, :players

    include AggregateRoot

    def initialize(id)
      @id = id
      @state = :draft
      @players = []
    end

    def add_player(id:, name:)
      # raise AlreadyFinished
      apply Events::PlayerAdded.new(data: { player_id: id, player_name: name, competition_id: id })
    end

    private

    attr_writer :state

    def apply_competition_started(event)
      state = :started
    end

    def apply_player_added(event)
      player_id = event.data.fetch(:player_id)
      player_name = event.data.fetch(:player_name)
      @players << {id: player_id, name: player_name}
    end
  end
end
