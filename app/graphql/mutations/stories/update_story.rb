module Mutations
  module Stories
    class UpdateStory < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :title, String, required: false
      argument :body_text, String, required: false
      argument :word, String, required: false
      argument :image, String, required: false
      argument :sound, String, required: false
      argument :total_time_in_seconds, Integer, required: false

      field :story, Types::StoryType, null: false

      def resolve(attributes)
        begin
          story = Story.find(attributes[:id])
          story.update(attributes)

          {story: story}
        rescue ActiveRecord::RecordNotFound => _e
          GraphQL::ExecutionError.new('Story does not exist.')
        rescue ActiveRecord::RecordInvalid => e
          GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
            " #{e.record.errors.full_messages.join(', ')}")
        end
      end
    end
  end
end
