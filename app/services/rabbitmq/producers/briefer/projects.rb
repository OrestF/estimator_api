module Rabbitmq
  module Producers
    module Briefer
      class Projects
        def initialize(project)
          @queue = 'estimator.projects.brief'
          @project = project
        end

        def self.call(project)
          new(project).call
        end

        def call
          publish(message)
        end

        private

        def publish(message)
          Amqp.publish(@queue, message)
        end

        def message
          {
            id: @project.id.to_s,
            title: @project.name,
            description: @project.description
          }
        end
      end
    end
  end
end
