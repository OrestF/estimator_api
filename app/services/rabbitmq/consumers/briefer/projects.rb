module Rabbitmq
  module Consumers
    module Briefer
      class Projects
        include Sneakers::Worker
        from_queue('briefer.projects', durable: false)

        def work(msg)
          Sneakers.logger.info("Raw data: ##{msg}")
          msg = JSON.parse(msg)
          Estimation::Projects::Update.call(Project.find(msg['id']), brief_description: msg['brief'])
          ack!
        end
      end
    end
  end
end
