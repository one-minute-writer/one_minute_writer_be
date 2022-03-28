module Types
  class MutationType < Types::BaseObject
    field :delete_story, mutation: Mutations::Stories::DeleteStory
    field :update_story, mutation: Mutations::Stories::UpdateStory
    field :create_story, mutation: Mutations::Stories::CreateStory
    field :create_user, mutation: Mutations::Users::CreateUser
    field :update_user, mutation: Mutations::Users::UpdateUser
    field :delete_user, mutation: Mutations::Users::DeleteUser
  end
end
