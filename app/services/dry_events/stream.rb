module DryEvents
  class Stream
    REGISTERED_EVENTS = %w[events.test projects.created].freeze
    include Dry::Events::Publisher[:default_stream]

    # rubocop:disable Style/RedundantSelf
    REGISTERED_EVENTS.each do |event_name|
      self.register_event(event_name)
    end
    # rubocop:enable Style/RedundantSelf
  end
end
