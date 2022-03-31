require 'rails_helper'

module Mutations
  module Stories
    RSpec.describe CreateStory, type: :request do
      describe 'create story' do
        def query
          <<~GQL
            mutation {
              createStory(input:
              { userId: #{User.last.id},
                title: "Thoughts",
                bodyText: "hello world",
                word: "test",
                image: "http://test-url",
                sound: "echo",
                totalTimeInSeconds: 120 } ) {
            	story {
              	title
              	bodyText
                word
                image
                sound
                totalTimeInSeconds
                }
              }
            }
          GQL
        end

        it 'can create a story' do
          create_list(:user, 5)

          post '/graphql', params: { query: query }

          story = parse_json[:data][:createStory][:story]

          expect(story).to have_key(:title)
          expect(story).to have_key(:bodyText)
          expect(story).to have_key(:word)
          expect(story).to have_key(:image)
          expect(story).to have_key(:sound)
          expect(story).to have_key(:totalTimeInSeconds)
        end
      end
    end
  end
end