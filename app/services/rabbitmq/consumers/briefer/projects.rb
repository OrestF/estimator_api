module Rabbitmq
  module Consumers
    module Briefer
      class Projects
        include Sneakers::Worker
        from_queue('briefer.projects', durable: false)

        def work(msg)
          Sneakers.logger.info("Raw data: ##{msg}")
          ack!
        end
      end
    end
  end
end
