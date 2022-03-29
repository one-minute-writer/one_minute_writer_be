module Mutations
  module Users
    class DeleteUser < Mutations::BaseMutation
      argument :id, ID, required: true

      field :user, Types::UserType, null: false

      def resolve(attributes)
        begin
          user = User.find(attributes[:id])
          user.destroy

          {user: user}
        rescue ActiveRecord::RecordInvalid => e
          GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
            " #{e.record.errors.full_messages.join(', ')}")
        end
      end
    end
  end
end
