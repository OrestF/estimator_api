module Estimation
  module Tasks
    class Serializer < ApplicationSerializer
      identifier :id
      fields :tech, :name

      # rubocop:disable Style/SymbolProc
      view :with_marks do
        field :average_marks do |task|
          task.avg_marks
        end
      end
      # rubocop:enable Style/SymbolProc
    end
  end
end
