module Queries
  module Stories
    class FetchStories < Queries::BaseQuery

      type [Types::StoryType], null: false

      def resolve
        Story.all.order(created_at: :desc)
      end
    end
  end
end
