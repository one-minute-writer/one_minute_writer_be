module Mutations
  class CreateUser < Mutations::BaseMutation
    argument :username, String, required: true
    argument :email, String, required: true

    field :user, Types::UserType, null: false

    def resolve(attributes)
      begin
        user = User.create!(attributes)

        { user: user }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
