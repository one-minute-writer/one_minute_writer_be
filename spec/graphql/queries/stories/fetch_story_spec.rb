require 'rails_helper'
module Queries
  module Stories
    RSpec.describe FetchStory, type: :request do
      def query
        <<~GQL
          {
            fetchStory(id: #{Story.first.id})
            {
              id
              title
              word
              bodyText
              image
              sound
              totalTimeInSeconds
            }
          }
        GQL
      end
      def bad_query
        <<~GQL
          {
            fetchStory(id: 0) {
            id
            title
          }
        }
        GQL
      end
      it 'gets a story by id' do
        user = create(:user)
        create_list(:story, 4, user_id: user.id)
        post '/graphql', params: { query: query }
        story = parse_json[:data][:fetchStory]

        expect(story[:id]).to eq(user.stories.first.id.to_s)
        expect(story[:title]).to eq(user.stories.first.title)
        expect(story[:bodyText]).to eq(user.stories.first.body_text)
        expect(story[:word]).to eq(user.stories.first.word)
        expect(story[:image]).to eq(user.stories.first.image)
        expect(story[:sound]).to eq(user.stories.first.sound)
        expect(story[:totalTimeInSeconds]).to eq(user.stories.first.total_time_in_seconds)
      end


      it 'throws an error if user does not exist' do
        create_list(:user, 4)
        post '/graphql', params: { query: bad_query }
        data = parse_json

        expect(data[:errors].first[:message]).to eq('Story does not exist.')
      end
    end
  end
end