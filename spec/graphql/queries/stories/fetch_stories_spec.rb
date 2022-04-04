require 'rails_helper'

module Queries
  module Stories
    RSpec.describe FetchStories, type: :request do
      def query
        <<~GQL
          {
            fetchStories
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
            fetchStories(id: 1) {
            id
            title
          }
        }
        GQL
      end

      it 'returns all stories' do
        stories = create_list(:story, 10)

        post '/graphql', params: { query: query }

        stories = parse_json[:data][:fetchStories]

        expect(response).to be_successful
        expect(stories.length).to eq(10)

        stories.each do |story|
          expect(story).to have_key(:id)
          expect(story).to have_key(:title)
          expect(story).to have_key(:word)
          expect(story).to have_key(:bodyText)
          expect(story).to have_key(:image)
          expect(story).to have_key(:sound)
          expect(story).to have_key(:totalTimeInSeconds)
        end
      end

      it 'returns an empty array if there are no stories' do
        post '/graphql', params: { query: query }

        stories = parse_json[:data][:fetchStories]

        expect(response).to be_successful
        expect(stories.length).to eq(0)
        expect(stories).to eq([])
      end
    end
  end
end
