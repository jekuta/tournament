Rails.application.config.event_store = EventStore.instance

AggregateRoot.configure do |config|
  config.default_event_store = EventStore.instance
end
