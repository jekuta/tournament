module CommandHandler
  class StartCompetition
    def call(command)
      with_aggregate(Aggregate::Competition, command.aggregate_id) do |competition|
        competition.start
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
