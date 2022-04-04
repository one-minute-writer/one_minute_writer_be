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
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
