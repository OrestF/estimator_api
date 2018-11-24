module Staff
  module Organizations
    class Update < Mutators::Update
      def model
        Organization
      end
    end
  end
end
