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
        rescue ActiveRecord::RecordNotFound => e
          GraphQL::ExecutionError.new("Could not find user.")
        end
      end
    end
  end
end
