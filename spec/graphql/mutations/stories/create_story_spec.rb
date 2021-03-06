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
                image: {author: "william", download_url: "http:test_url.com"},
                sound: {title: "denver skyline", src: "http:beautifuldenver.com"},
                totalTimeInSeconds: 120 } ) {
              story {
                title
                bodyText
                word
                image
                sound
                totalTimeInSeconds
                createdAt
                updatedAt
              }
            }
          }
          GQL
        end

        def bad_attr_query
          <<~GQL
          mutation {
            createStory(input:
              { userId: #{User.last.id},
                title: "Thoughts",
                bodyText: "hello world",
                word: 5000,
                image: {author: "william", download_url: "http:test_url.com"},
                sound: {title: "denver skyline", src: "http:beautifuldenver.com"},
                totalTimeInSeconds: 120 } ) {
              story {
                title
                bodyText
                word
                image
                sound
                totalTimeInSeconds
                createdAt
                updatedAt
              }
            }
          }
          GQL
        end

        def bad_query
          <<~GQL
            mutation {
              createStory(
                input: {
                  title: "Thoughts",
                  bodyText: "hello world",
                  word: "test",
                  sound: "echo",
                  totalTimeInSeconds: 120
                }
              )
              {
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

        def bad_keys_query
          <<~GQL
          mutation {
            createStory(input:
              { userId: #{User.last.id},
                title: "Thoughts",
                bodyText: "hello world",
                word: "test",
                image: {x: "william", x: "http:test_url.com"},
                sound: {x: "denver skyline", x: "http:beautifuldenver.com"},
                totalTimeInSeconds: 120 } ) {
              story {
                title
                bodyText
                word
                image
                sound
                totalTimeInSeconds
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

        it 'can create a story' do
          create_list(:user, 5)

          post '/graphql', params: { query: query }

          story = parse_json[:data][:createStory][:story]

          expect(Story.all.length).to eq(1)
          expect(story).to have_key(:title)
          expect(story).to have_key(:bodyText)
          expect(story).to have_key(:word)
          expect(story).to have_key(:image)
          expect(story[:image]).to have_key(:author)
          expect(story[:image]).to have_key(:download_url)
          expect(story).to have_key(:sound)
          expect(story[:sound]).to have_key(:title)
          expect(story[:sound]).to have_key(:src)
          expect(story).to have_key(:totalTimeInSeconds)
          expect(story).to have_key(:createdAt)
          expect(story).to have_key(:updatedAt)
        end

        it 'only accepts correct attributes' do
          create_list(:user, 5)

          post '/graphql', params: { query: bad_query }

          response = parse_json

          expect(response[:errors].first[:message]).to eq("Argument 'userId' on InputObject 'CreateStoryInput' is required. Expected type Int!")
          expect(response[:errors].last[:message]).to eq("Argument 'image' on InputObject 'CreateStoryInput' is required. Expected type Image!")
        end

        it 'will not accept image or sound without proper keys' do
          create_list(:user, 5)

          post '/graphql', params: { query: bad_keys_query }

          response = parse_json

          expect(Story.all.length).to eq(0)
          expect(response[:errors].first[:message]).to eq("Invalid attributes for story: Image or Sound")
        end

        it 'will not accept invalid attributes' do
          create_list(:user, 5)

          post '/graphql', params: { query: bad_attr_query }

          response = parse_json

          expect(response[:errors][0][:message]).to eq("Argument 'word' on InputObject 'CreateStoryInput' has an invalid value. Expected type 'String!'.")
        end
      end
    end
  end
end
