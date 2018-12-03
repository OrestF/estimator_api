module Estimation
  module Tasks
    class Search
      def self.call(query, tech, limit: 10, offset: 0)
        new(query, tech, limit, offset).call
      end

      def initialize(query, tech, limit, offset)
        @query = query
        @tech = tech
        @limit = limit
        @offset = offset
      end

      def call
        model.search(@query, scope.merge!(pagination))
      end

      private

      def scope
        { where: { tech: @tech } }
      end

      def pagination
        { limit: @limit, offset: @offset }
      end

      def model
        Task
      end
    end
  end
end

