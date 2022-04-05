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

  def validate_image_sound_keys
    if !self.sound["title"].is_a?(String) || !self.sound["src"].is_a?(String)
      false
    elsif !self.image["author"].is_a?(String) || !self.image["download_url"].is_a?(String)
      false
    else
      return true
    end
  end
  
end
