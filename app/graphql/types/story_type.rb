module Types
  class StoryType < Types::BaseObject
    field :id, ID, null: false
    field :body_text, String, null: false
    field :image, Types::ImageType, null: false
    field :sound, Types::SoundType, null: false
    field :word, String, null: false
    field :total_time_in_seconds, Integer, null: false
    field :title, String, null: false

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
