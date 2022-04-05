require 'rails_helper'

module Mutations
  module Users
    RSpec.describe CreateUser, type: :request do
      describe 'create user' do
        def query
          <<~GQL
            mutation {
              createUser(
                input: {
                  username: "Lassie",
                  email: "sillyboy@inwell.com"
                }
              )
              {
                user {
                    username
                    email
                    dashboardMetrics
                }
              }
            }
          GQL
        end

        def bad_query
          <<~GQL
            mutation
            {
              createUser(
                input: {
                  username: "",
                  email: "sillyboy@inwell.com"
                }
              )
              {
                user {
                  username
                  email
                }
              }
            }
          GQL
        end

        it 'creates a user' do
          current_users = User.count

          post '/graphql', params: { query: query }

          data = parse_json[:data]

          expect(User.count).to eq(current_users + 1)
          expect(data).to be_a Hash
          expect(data[:createUser][:user]).to have_key(:username)
          expect(data[:createUser][:user]).to have_key(:email)
          expect(data[:createUser][:user]).to have_key(:dashboardMetrics)
        end

        xit 'returns user metrics from python service' do
          create_list(:story, 5, user_id: User.first.id)
          
          post '/graphql', params: { query: query }

          data = parse_json[:data]


          require "pry"; binding.pry
        end

        it 'fails to create a user' do
          post '/graphql', params: { query: bad_query }

          response = parse_json

          expect(response[:errors].first[:message]).to eq("Invalid attributes for User: Username can't be blank")
        end
      end
    end
  end
end
