module Tasks
  module Search
    extend ActiveSupport::Concern

    included do
      searchkick match: :text_middle
    end

    def search_data
      {
        name: name,
        tech: tech
      }
    end
  end
end
