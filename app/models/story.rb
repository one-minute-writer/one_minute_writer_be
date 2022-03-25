class Story < ApplicationRecord
    validates_presence_of :user_id,
                          :total_time,
                          :body_text,
                          :image,
                          :words,
                          :sound
end
