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
                image: { author: "Andrew", download_url: "http://test_url.com" },
                word: "Update",
                sound: { src: "http://sound_url.com", title: "Jumping Cat" },
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
                createdAt
                updatedAt
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
                image: { author: "Andrew", download_url: "http://test_url.com" },
                word: "Update",
                sound: { src: "http://sound_url.com", title: "Jumping Cat" },
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
                image: { author: "Andrew", download_url: "http://test_url.com" },
                word: "Update",
                sound: { src: "http://sound_url.com", title: "Jumping Cat" },
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
                createdAt
                updatedAt
              }
            }
          }
        GQL
      end

      before(:each) do
        metrics_post_response = File.read('./spec/support/stubbed_api_responses/dashboard_metrics_post_response.json')

        their_site = 'https://enigmatic-oasis-75046.herokuapp.com'

        stub_request(:post, /#{their_site}.*/ ).to_return(body: metrics_post_response, status: 201)
      end

      it 'updates a story' do
        story = create(:story)

        post '/graphql', params: { query: query }

        data = parse_json[:data]

        expect(data[:updateStory][:story][:id]).to eq(story.id.to_s)
        expect(data[:updateStory][:story][:title]).to eq("New Title")
        expect(data[:updateStory][:story][:bodyText]).to eq("New Text")
        expect(data[:updateStory][:story][:image]).to eq({:author=>"Andrew", :download_url=>"http://test_url.com"})
        expect(data[:updateStory][:story][:word]).to eq("Update")
        expect(data[:updateStory][:story][:sound]).to eq({:src=>"http://sound_url.com", :title=>"Jumping Cat"})
        expect(data[:updateStory][:story][:totalTimeInSeconds]).to eq(5000)
        expect(data[:updateStory][:story][:createdAt]).to eq(story.created_at.strftime('%FT%TZ'))
        expect(data[:updateStory][:story][:updatedAt]).to eq(story.updated_at.strftime('%FT%TZ'))
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

        expect(message.first[:message]).to eq("Field 'username' doesn't exist on type 'Story'")
      end
    end
  end
end
