require 'rails_helper'

module Mutations
  module Users
    RSpec.describe CreateUser, type: :request do
      describe 'create user' do
        def query
          <<~GQL
            mutation {
              createUser(input:
                { username: "Lassie", email: "sillyboy@inwell.com" } ) {
      	      user {
        	      username
        	      email
              }
              }
            }
          GQL
        end

        it 'updates a user' do
          expect(User.count).to eq(0)

          post '/graphql', params: { query: query }

          data = parse_json[:data]

          expect(User.count).to eq(1)
          expect(data).to be_a Hash
          expect(data[:createUser][:user]).to have_key(:username)
          expect(data[:createUser][:user]).to have_key(:email)
        end
      end
    end
  end
end
