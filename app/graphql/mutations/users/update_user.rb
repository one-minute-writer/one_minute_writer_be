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
        rescue ActiveRecord::RecordNotFound => _e
          GraphQL::ExecutionError.new('User does not exist.')
        end
      end
    end
  end
end
