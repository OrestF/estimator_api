module Staff
  module Organizations
    class Create < Mutators::Create
      def model
        Organization
      end
    end
  end
end
