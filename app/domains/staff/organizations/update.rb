module Staff
  module Organizations
    class Update < Mutators::Update
      def repo
        Organization
      end
    end
  end
end
