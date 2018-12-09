class AmqpPublishJob < ApplicationJob
  queue_as :amqp

  def perform(queue, message)
    Amqp.publish(queue, message)
  end
end
