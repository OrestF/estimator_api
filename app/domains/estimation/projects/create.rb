module Estimation
  module Projects
    class Create < Mutators::Create
      def call
        record.save

        return record if record.errors.any?

        publish_event

        record
      end

      def repo
        Project
      end

      private

      def publish_event
        EVENTS.publish('projects.created', record: record)
      end
    end
  end
end
