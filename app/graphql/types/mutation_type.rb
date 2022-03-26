module Types
  class MutationType < Types::BaseObject
    field :add_user, mutation: Mutations::AddUser
    field :edit_user, mutation: Mutations::EditUser
  end
end
