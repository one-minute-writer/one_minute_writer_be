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
          post '/graphql', params: { query: query }

          data = parse_json[:data]

          expect(current_user_count).to eq(user_record_length + 1)
          expect(symbolized).to be_a Hash
          expect(symbolized[:data][:createUser][:user]).to have_key(:username)
          expect(symbolized[:data][:createUser][:user]).to have_key(:email)
        end

        it 'can create a user' do
          user_record_length = User.all.length
          result = OneMinuteWriterBeSchema.execute(query).as_json
          symbolized = result.deep_symbolize_keys!
          current_user_count = User.all.length

          expect(current_user_count).to eq(user_record_length + 1)
          expect(symbolized).to be_a Hash
          expect(symbolized[:data][:createUser][:user]).to have_key(:username)
          expect(symbolized[:data][:createUser][:user]).to have_key(:email)
        end
      end
    end
  end
end
