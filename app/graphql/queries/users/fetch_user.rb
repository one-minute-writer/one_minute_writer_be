module Queries
  module Users
    class FetchUser < Queries::BaseQuery
      type Types::UserType, null: false
      argument :id, ID, required: true

      def resolve(id:)
        user = User.find(id)
        user.update_metrics
        user

      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('User does not exist.')
      end
    end
  end
end
