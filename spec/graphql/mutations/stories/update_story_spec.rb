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
              }
            )
            { 
              story {
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

      def bad_id_query
        <<~GQL
          mutation {
            updateStory(
              input: {
                id: 150150
                title: "New Title",
                bodyText: "New Text",
                image: "Sample image",
                word: "Update",
                sound: "Alert!",
                totalTimeInSeconds: 5000
              }
            )
            { 
              story {
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

      def bad_attr_query
        <<~GQL
          mutation {
            updateStory(
              input: {
                id: #{Story.last.id}
                title: "New Title",
                bodyText: "New Text",
                image: "Sample image",
                word: "Update",
                sound: 10,
                totalTimeInSeconds: 5000
              }
            )
            { 
              story {
                id
                title
                bodyText
                username
                image
                word
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

      it 'story does not exist (sad path)' do
        post '/graphql', params: { query: bad_id_query }

        message = parse_json[:errors].first[:message]
        expect(message).to eq('Story does not exist.')
      end

      it 'does not update with other attributes (sad path)' do
        @story = create(:story)

        post '/graphql', params: { query: bad_attr_query }

        message = parse_json[:errors]

        expect(message.first[:message]).to eq("Argument 'sound' on InputObject 'UpdateStoryInput' has an invalid value. Expected type 'String'.")
        expect(message.second[:message]).to eq("Field 'username' doesn't exist on type 'Story'")
      end
    end
  end
end
