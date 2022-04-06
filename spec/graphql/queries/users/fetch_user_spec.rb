require 'rails_helper'

module Queries
  module Users
    RSpec.describe FetchUser, type: :request do
      def query
        <<~GQL
          {
            fetchUser(id: #{User.first.id}) {
              id
              username
              email
              dashboardMetrics
            }
          }
        GQL
      end

      def bad_query
        <<~GQL
          {
            fetchUser(id: 0) {
            id
            username
            email
          }
        }
        GQL
      end

      before(:each) do
        metrics_get_response = File.read('./spec/support/stubbed_api_responses/dashboard_metrics_get_response.json')

        their_site = 'https://enigmatic-oasis-75046.herokuapp.com'

        stub_request(:get, /#{their_site}.*/ ).to_return(body: metrics_get_response, status: 200)
      end

      it 'gets a user by id' do
        create_list(:user, 4)

        post '/graphql', params: { query: query }

        data = parse_json[:data]

        expect(data[:fetchUser][:id]).to eq(User.first.id.to_s)
        expect(data[:fetchUser][:username]).to eq(User.first.username)
        expect(data[:fetchUser][:email]).to eq(User.first.email)
      end

      it 'throws an error if user does not exist' do
        create_list(:user, 4)

        post '/graphql', params: { query: bad_query }

        data = parse_json

        expect(data[:errors].first[:message]).to eq('User does not exist.')
      end

      it 'will return a users dashboard metrics' do
        create(:user, id: 1)
        create(:story, id: 1)
        create(:story, id: 2)
        create(:story, id: 3)

        post '/graphql', params: { query: query }

        data = parse_json[:data]

        expect(data[:fetchUser][:dashboardMetrics]).to have_key(:total_words_all_time)
        expect(data[:fetchUser][:dashboardMetrics]).to have_key(:total_time)
        expect(data[:fetchUser][:dashboardMetrics]).to have_key(:average_words_per_minute)
      end
    end
  end
end
