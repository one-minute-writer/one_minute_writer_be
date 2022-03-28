module Queries
  class FetchStory < Queries::BaseQuery
    type Types::StoryType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      Story.find(id)

    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Story does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
