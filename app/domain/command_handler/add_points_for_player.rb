module CommandHandler
  class AddPointsForPlayer
    def call(command)
      with_aggregate(Aggregate::Competition, command.aggregate_id) do |competition|
        competition.add_points(player_id: command.player_id, points: command.points)
      end
    end

    private

    def with_aggregate(aggregate_class, aggregate_id)
      stream = "#{aggregate_class.name}$#{aggregate_id}"
      aggregate = aggregate_class.new(aggregate_id).load(stream)
      yield aggregate
      aggregate.store
    end
  end
end
