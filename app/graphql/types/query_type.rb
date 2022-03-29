module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :fetch_users, resolver: Queries::Users::FetchUsers
    field :fetch_user, resolver: Queries::Users::FetchUser
    field :fetch_stories, resolver: Queries::Stories::FetchStories
    field :fetch_story, resolver: Queries::Stories::FetchStory
    #field :errors
  end
end
