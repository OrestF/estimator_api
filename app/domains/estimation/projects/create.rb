module Estimation
  module Projects
    class Create < Mutators::Create
      def call
        record.save

        return record if record.errors.any?

        brief_description

        record
      end

      def repo
        Project
      end

      private

      def brief_description
        return if record.description.blank?

        Rabbitmq::Producers::Briefer::Projects.call(record)
      end
    end
  end
end
