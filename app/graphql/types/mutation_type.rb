module Types
  class MutationType < Types::BaseObject
    field :delete_story, mutation: Mutations::DeleteStory
    field :update_story, mutation: Mutations::UpdateStory
    field :create_story, mutation: Mutations::CreateStory
    field :create_user, mutation: Mutations::CreateUser
    field :update_user, mutation: Mutations::UpdateUser
    field :delete_user, mutation: Mutations::DeleteUser
  end
end
