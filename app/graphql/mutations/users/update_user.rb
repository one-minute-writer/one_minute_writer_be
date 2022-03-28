module Mutations
  module Users
    class UpdateUser < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :username, String, required: false
      argument :email, String, required: false

      field :user, Types::UserType, null: false

      def resolve(attributes)
        begin
          user = User.find(attributes[:id])
          user.update!(attributes)

          {user: user}
        rescue ActiveRecord::RecordInvalid => e
          GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
            " #{e.record.errors.full_messages.join(', ')}")
        end
      end
    end
  end
end
