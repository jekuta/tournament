module Aggregate
  class Competition
    attr_reader :id, :state, :players

    include AggregateRoot

    def initialize(id)
      @id = id
      @state = :created
      @players = []
    end

    def add_player(id:, name:)
      # raise AlreadyFinished
      apply Events::PlayerAdded.new(data: { player_id: id, player_name: name, competition_id: id })
    end

    def start
      apply Events::CompetitionStarted.new(data: { competition_id: id})
    end

    def started?
      state == :started
    end

    def finish
      apply Events::CompetitionFinished.new(data: { competition_id: id})
    end

    def finished?
      state == :finished
    end

    def add_points(player_id:, points:)
      apply Events::PlayerScoresPoints.new(
        data: {
          competition_id: id,
          player_id: player_id,
          points: points
        }
      )
    end

    def winning_player
      players.max { |player| player.points }
    end

    def players_sorted_by_points
      players.sort_by { |player| -player.points }
    end

    private

    attr_writer :state

    def apply_competition_started(event)
      @state = :started
    end

    def apply_competition_finished(event)
      @state = :finished
    end

    def apply_player_added(event)
      player_id = event.data.fetch(:player_id)
      player_name = event.data.fetch(:player_name)
      @players << Entities::Player.new(id: player_id, name: player_name)
    end

    def apply_player_scores_points(event)
      player = find_player(event.data.fetch(:player_id))
      points = event.data.fetch(:points)

      player.add_points(points)
    end

    def find_player(id)
      players.detect { |player| player.id == id }
    end
  end
end
