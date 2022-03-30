require 'rails_helper'

module Mutations
  module Users
    RSpec.describe UpdateUser, type: :request do
      describe '.resolve' do

        def query
          <<~GQL
          mutation {
            updateUser(
              input: {
                id: "1001",
                username: "Bob Lee Swagger",
                email: "blees@gmail.com"
                })
                { user {
                  username
                  id
                  email
                }
              }
            }
            GQL
          end

        it 'updates a user' do
          @bob = create(:user, id: 1001, username: "Bob", email: "Bobathan@gmail.com")

          post '/graphql', params: { query: query }

          data = parse_json[:data]

          expect(data[:updateUser][:user][:id]).to eq(@bob.id.to_s)
          expect(data[:updateUser][:user][:username]).to eq('Bob Lee Swagger')
          expect(data[:updateUser][:user][:email]).to eq('blees@gmail.com')
        end
      end
    end
  end
end
