module Mutations
  module Stories
    class CreateStory < Mutations::BaseMutation
      argument :user_id, Integer, required: true
      argument :title, String, required: true
      argument :body_text, String, required: true
      argument :word, String, required: true
      argument :image, Types::ImageType, required: true
      argument :sound, Types::SoundType, required: true
      argument :total_time_in_seconds, Integer, required: true

      field :story, Types::StoryType, null: false

      def resolve(attributes)
        begin
          user = User.find(attributes[:user_id])
          story = user.stories.create!(attributes)
          #add facade/service call to post to django server
          #make word_count an instance method
          #DashboardMetricsFacade.post_writing_metrics(story.id, story.word_count, story.total_time_in_seconds)


          { story: story }
        rescue ActiveRecord::RecordInvalid => e
          GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
            " #{e.record.errors.full_messages.join(', ')}")
        end
      end
    end
  end
end
