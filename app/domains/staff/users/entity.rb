module Staff
  module Users
    module Entity
      def member?(organization)
        organizations.include?(organization)
      end
    end
  end
end
