module EventStore
  def self.instance
    RailsEventStore::Client.new.tap do |store|
      store.subscribe(empty_lambda, [Events::PlayerAdded])
    end
  end

  def self.empty_lambda
    Proc.new {}
  end
end
