module Mutations
  module Stories
    class DeleteStory < Mutations::BaseMutation
      argument :id, ID, required: true

      field :story, Types::StoryType, null: false

      def resolve(attributes)
        begin
          story = Story.find(attributes[:id])
          story.destroy

          {story: story}
        rescue ActiveRecord::RecordNotFound => e
          GraphQL::ExecutionError.new("Could not find story.")
        end
      end
    end
  end
end
