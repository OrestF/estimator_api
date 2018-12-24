module DryEvents
  module Listeners
    class Projects
      def on_projects_created(event)
        return if event[:record].description.blank?

        Rabbitmq::Producers::ProjectsBrief.call(event[:record])
      end
    end
  end
end
