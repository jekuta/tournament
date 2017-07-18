module Events
  PlayerAdded = Class.new(RailsEventStore::Event)
  CompetitionStarted = Class.new(RailsEventStore::Event)
end
