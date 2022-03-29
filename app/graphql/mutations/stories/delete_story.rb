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
        # rescue ActiveRecord::RecordInvalid => e
        #   GraphQL::ExecutionError.new("Invalid id for #{e.record.class}:"\
        #     " #{e.record.errors.full_messages.join(', ')}")
        end
      end
    end
  end
end
