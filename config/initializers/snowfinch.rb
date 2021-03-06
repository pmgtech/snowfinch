require Rails.root.join("lib/configuration.rb")
require Rails.root.join("lib/mongo_ext.rb")

Snowfinch::Collector.db = Mongo.db

if defined?(PhusionPassenger)
  PhusionPassenger.on_event(:starting_worker_process) do |forked|
    if forked
      Mongo.db.connection.connect
    end
  end
end
