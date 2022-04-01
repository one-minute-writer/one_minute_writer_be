require 'rails_helper'

module Mutations
  module Stories
    RSpec.describe DeleteStory, type: :request do
      def query
        <<~GQL
          mutation {
            deleteStory(
              input: {
                id: "#{@story.id}",
              }
            ) 
            { 
              story {
                id
                title
              }
            }
          }
        GQL
      end

      def bad_query
        <<~GQL
          mutation {
            deleteStory(
              input: {
                id: "10900",
              }
            ) 
            { 
              story {
                id
                title
              }
            }
          }
        GQL
      end

      it 'deletes a story' do
        stories = create_list(:story, 5)
        @story = create(:story, title: 'Deleted')

        post '/graphql', params: { query: query }

        response = parse_json[:data]
        expect(response[:deleteStory][:story][:title]).to eq('Deleted')
        expect(Story.last.title).to_not eq('Deleted')
      end

      it 'cant find story to delete' do
        stories = create_list(:story, 5)

        post '/graphql', params: { query: bad_query }

        message = parse_json[:errors].first[:message]

        expect(message).to eq("Could not find story.")
      end
    end
  end
end
