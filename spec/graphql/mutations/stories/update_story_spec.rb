require 'rails_helper'

module Mutations
  module Stories
    RSpec.describe UpdateStory, type: :request do
      def query
        <<~GQL
        mutation {
          updateStory(
            input: {
              id: #{Story.last.id},
              title: "New Title",
              bodyText: "New Text",
              image: "Sample image",
              word: "Update",
              sound: "Alert!",
              totalTimeInSeconds: 5000
              })
              { story {
                id
                title
                bodyText
                image
                word
                sound
                totalTimeInSeconds
              }
            }
          }
        GQL
      end

      it 'updates a story' do
        @story = create(:story)

        post '/graphql', params: { query: query }

        data = parse_json[:data]

        expect(data[:updateStory][:story][:id]).to eq(@story.id.to_s)
        expect(data[:updateStory][:story][:title]).to eq("New Title")
        expect(data[:updateStory][:story][:bodyText]).to eq("New Text")
        expect(data[:updateStory][:story][:image]).to eq("Sample image")
        expect(data[:updateStory][:story][:word]).to eq("Update")
        expect(data[:updateStory][:story][:sound]).to eq("Alert!")
        expect(data[:updateStory][:story][:totalTimeInSeconds]).to eq(5000)
      end
    end
  end
end
