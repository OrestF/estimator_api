EVENTS = DryEvents::Stream.new

listeners = [DryEvents::Listeners::Projects]

listeners.each do |listener|
  EVENTS.subscribe(listener.new)
end
