module Estimation
  module Projects
    class RemoveEstimators
      def self.call(project, estimator_ids)
        new(project, estimator_ids).call
      end

      def initialize(project, estimator_ids)
        @project = project
        @estimator_ids = estimator_ids
      end

      def call
        remove_estimators

        project
      end

      private

      attr_accessor :project, :estimator_ids

      def remove_estimators
        ids = project.estimators.ids - Array(estimator_ids)
        project.update(user_ids: ids)
      end
    end
  end
end
