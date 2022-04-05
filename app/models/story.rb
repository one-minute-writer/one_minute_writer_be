class Story < ApplicationRecord
  belongs_to :user

  #image & sound validated in createStory, updateStory mutations
  validates_presence_of :user_id,
                        :title,
                        :total_time_in_seconds,
                        :body_text,
                        :word

  def word_count
    self.body_text.split.size
  end
end
