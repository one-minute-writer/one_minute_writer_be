require 'rails_helper'

module Mutations
  RSpec.describe DeleteUser, type: :request do
    def query
      <<~GQL
        mutation {
        deleteUser(
          input: {
            id: "#{@bob.id}",
          }
        ) { user {
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
    end
  end
end