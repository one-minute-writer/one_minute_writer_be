module Mutations
  module Stories
    class UpdateStory < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :title, String, required: false
      argument :body_text, String, required: false
      argument :word, String, required: false
      argument :image, Types::ImageType, required: false
      argument :sound, Types::SoundType, required: false
      argument :total_time_in_seconds, Integer, required: false

      field :story, Types::StoryType, null: false

      def resolve(attributes)
        begin
          story = Story.find(attributes[:id])

          story.update(attributes)

          DashboardMetricsFacade.post_writing_metrics(story.id, story.word_count, story.total_time_in_seconds)

          {story: story}
        rescue ActiveRecord::RecordNotFound => _e
          GraphQL::ExecutionError.new('Story does not exist.')
        end
      end
    end
  end
end
