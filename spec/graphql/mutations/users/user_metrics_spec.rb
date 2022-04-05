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

        it 'returns user metrics from python service' do
          post '/graphql', params: { query: query }

          data = parse_json[:data]

          create_list(:story, 5, user_id: User.first.id)
        end
      end
    end
  end
end
