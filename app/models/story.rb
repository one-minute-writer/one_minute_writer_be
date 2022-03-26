class Story < ApplicationRecord
  belongs_to :user

  validates_presence_of :user_id,
                        :total_time,
                        :body_text,
                        :image,
                        :word,
                        :sound
end
