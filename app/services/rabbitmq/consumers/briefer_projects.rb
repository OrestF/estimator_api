module Rabbitmq
  module Consumers
    class BrieferProjects
      include Sneakers::Worker
      from_queue('briefer.projects', durable: false)

      def work(msg)
        Sneakers.logger.info("Raw data: ##{msg}")
        msg = Oj.load(msg, {})
        Estimation::Projects::UpdateJob.perform_later(project_id: msg['id'], brief_description: msg['brief'])
        ack!
      end
    end
  end
end
