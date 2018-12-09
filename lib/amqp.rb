class Amqp
  def self.publish(queue, message = {})
    start_bunny

    channel ||= bunny.create_channel
    # grab the queue
    x = channel.queue(queue, durable: false, persistent: true)
    # and simply publish message
    x.publish(message.to_json)

    sleep 0.5
    channel.close
  end

  def self.start_bunny
    mutex.synchronize { bunny.start } unless bunny&.connected?
  end

  def self.bunny
    @bunny ||= Bunny.new(Creds.fetch(:rabbitmq_url))
  end

  def self.mutex
    @mutex ||= Mutex.new
  end
end
