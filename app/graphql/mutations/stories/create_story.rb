module Mutations
  module Stories
    class CreateStory < Mutations::BaseMutation
      argument :user_id, Integer, required: true
      argument :title, String, required: true
      argument :body_text, String, required: true
      argument :word, String, required: true
      argument :image, String, required: true
      argument :sound, String, required: true
      argument :total_time_in_seconds, Integer, required: true

      field :story, Types::StoryType, null: false

      def resolve(attributes)
        begin
          user = User.find(attributes[:user_id])
          story = user.stories.create!(attributes)

          { story: story }
        rescue ActiveRecord::RecordInvalid => e
          GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
            " #{e.record.errors.full_messages.join(', ')}")
        end
      end
    end
  end
end