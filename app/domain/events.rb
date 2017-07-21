module Events
  CompetitionStarted = Class.new(RailsEventStore::Event)
  PlayerAdded = Class.new(RailsEventStore::Event)
  PlayerScoresPoints = Class.new(RailsEventStore::Event)
end
