module Types
  class StoryType < Types::BaseObject
    field :id, ID, null: false
    field :body_text, String, null: false
    field :image, String, null: false
    field :sound, String, null: false
    field :word, String, null: false
    field :total_time_in_seconds, Integer, null: false
    field :title, String, null: false
  end
end
