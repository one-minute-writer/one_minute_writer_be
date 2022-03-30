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
            stories {
              id
              title
              word
            }
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

      it 'gets a user by id' do
        create_list(:user, 4)
        create_list(:story, 5, user_id: User.first.id)
        
        post '/graphql', params: { query: query }

        data = parse_json[:data]

        expect(data[:fetchUser][:id]).to eq(User.first.id.to_s)
        expect(data[:fetchUser][:username]).to eq(User.first.username)
        expect(data[:fetchUser][:email]).to eq(User.first.email)
        expect(data[:fetchUser][:stories].first[:id]).to eq(User.first.stories.first.id.to_s)
      end

      it 'throws an error if user does not exist' do
        create_list(:user, 4)
        
        post '/graphql', params: { query: bad_query }

        data = parse_json

        expect(data[:errors].first[:message]).to eq('User does not exist.')
      end
    end
  end
end
