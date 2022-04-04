require 'rails_helper'

module Mutations
  module Users
    RSpec.describe DeleteUser, type: :request do
      def query
        <<~GQL
          mutation {
            deleteUser(
              input: {
                id: "#{@bob.id}",
              }
            ) 
            { 
              user {
                username
              }
            }
          }
        GQL
      end

      def bad_query
        <<~GQL
          mutation {
            deleteUser(
              input: {
                id: "0",
              }
            ) 
            { 
              user {
                username
              }
            }
          }
        GQL
      end

      describe '.resolve' do
        it 'deletes a user' do
          @bob = create(:user, username: "Bob", email: "Bobathan@gmail.com")

          post '/graphql', params: { query: query }

          data = parse_json[:data]

          expect(data[:deleteUser][:user][:username]).to eq('Bob')
        end

        it 'can not find user to delete' do
          @bob = create(:user, username: "Bob", email: "Bobathan@gmail.com")

          post '/graphql', params: { query: bad_query }

          message = parse_json[:errors].first[:message]

          expect(message).to eq("Could not find user.")
        end
      end
    end
  end
end
