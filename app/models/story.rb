class Story < ApplicationRecord
  belongs_to :user

  validates_presence_of :user_id,
                        :title,
                        :total_time_in_seconds,
                        :body_text,
                        :image,
                        :word,
                        :sound
end
