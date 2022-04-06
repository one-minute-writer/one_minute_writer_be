module Queries
  module Stories
    class FetchStory < Queries::BaseQuery
      type Types::StoryType, null: false
      argument :id, ID, required: true

      def resolve(id:)
        Story.find(id)

      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Story does not exist.')
      end
    end
  end
end
