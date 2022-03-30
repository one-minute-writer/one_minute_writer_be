require 'rails_helper'

RSpec.describe Types::QueryType, type: :request do
  def query
    <<~GQL
    {
      fetchUsers {
        id
        username
        email
      }
    }
    GQL
  end

  it 'gets all users' do
    create_list(:user, 4)
    
    post '/graphql', params: { query: query }

    users = parse_json[:data][:fetchUsers]

    expect(users.count).to eq(User.count)
    expect(users.reverse.first[:id]).to eq(User.first.id.to_s)
    expect(users.reverse.first[:username]).to eq(User.first.username)
    expect(users.reverse.first[:email]).to eq(User.first.email)
  end

  it 'no users' do
    post '/graphql', params: { query: query }

    users = parse_json[:data][:fetchUsers]

    expect(users.empty?).to be(true)
  end
end
