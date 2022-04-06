class User < ApplicationRecord
  has_many :stories, :dependent => :destroy

  validates_presence_of :username, :email
  validates_uniqueness_of :email

  def update_metrics
    story_ids = []

    self.stories.each do |story|
      story_ids << story.id
    end

    metrics = DashboardMetricsFacade.get_writing_metrics(story_ids.join(','))

    self.dashboard_metrics[:total_words_all_time] = metrics.total_words_all_time
    self.dashboard_metrics[:total_time] = metrics.total_time
    self.dashboard_metrics[:average_words_per_minute] = metrics.average_words_per_minute
  end
end
