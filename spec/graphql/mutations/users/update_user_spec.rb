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

          def bad_query
          <<~GQL
          mutation {
            updateUser(
              input: {
                id: "1001",
                username: 10,
                email: "blees@gmail.com",
                location: "here"
                })
                { user {
                  username
                  id
                  email
                  location
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

        it 'user does not exist (sad path)' do
          @bob = create(:user, id: 1000, username: "Bob", email: "Bobathan@gmail.com")

          post '/graphql', params: { query: query }

          message = parse_json[:errors].first[:message]

          expect(message).to eq("User does not exist.")
        end

        it 'does not update with other attributes (sad path)' do
          @bob = create(:user, id: 1001, username: "Bob", email: "Bobathan@gmail.com")

          post '/graphql', params: { query: bad_query }

          message = parse_json[:errors]

          expect(message.first[:message]).to eq("Argument 'username' on InputObject 'UpdateUserInput' has an invalid value. Expected type 'String'.")
          expect(message.second[:message]).to eq("InputObject 'UpdateUserInput' doesn't accept argument 'location'")
          expect(message.third[:message]).to eq("Field 'location' doesn't exist on type 'User'")
        end
      end
    end
  end
end
