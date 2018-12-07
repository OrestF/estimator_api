module Staff
  module Organizations
    class Create < Mutators::Create
      def repo
        Organization
      end
    end
  end
end
