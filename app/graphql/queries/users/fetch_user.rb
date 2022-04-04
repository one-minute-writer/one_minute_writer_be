module Queries
  module Users
    class FetchUser < Queries::BaseQuery
      type Types::UserType, null: false
      argument :id, ID, required: true

      def resolve(id:)
        begin
          user = User.find(id)

          story_ids = []

          user.stories.each do |story|
            story_ids << story.id
          end

          metrics = DashboardMetricsFacade.get_writing_metrics(story_ids.join(','))

          user.dashboard_metrics[:total_words_all_time] = metrics.total_words_all_time
          user.dashboard_metrics[:total_time] = metrics.total_time

          {user: user}



        #user has to have updated metrics
        #AR to get array of story ids
        #send array to python/django
        #add return value as an attribute to user (ie 'dashboard_metrics')
        rescue ActiveRecord::RecordNotFound => _e
          GraphQL::ExecutionError.new('User does not exist.')
        rescue ActiveRecord::RecordInvalid => e
          GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
            " #{e.record.errors.full_messages.join(', ')}")
        end
      end
    end
  end
end
