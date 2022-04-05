require 'rails_helper'

RSpec.describe Story, type: :model do

  it 'exists' do
    story = create(:story)
    expect(story).to be_a Story
    expect(story.user).to be_a User
  end

  describe 'validations' do
    it { should belong_to :user }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :title }
    it { should validate_presence_of :total_time_in_seconds }
    it { should validate_presence_of :body_text }
    it { should validate_presence_of :word }
  end

  describe 'instance methods' do

    it '#word_count' do
      story = create(:story, body_text: "I once knew a lad named Ben. He went to feed his Hens.")
      result = story.word_count

      expect(result).to eq(13)
    end

    it '#validate_image_sound_keys' do
      story_data = {:user_id=>3511,
                    :title=>"Thoughts",
                    :body_text=>"hello world",
                    :word=>"test",
                    :image=>{"author"=>"william", "download_url"=>"http:test_url.com"},
                    :sound=>{"title"=>"denver skyline", "src"=>"http:beautifuldenver.com"},
                    :total_time_in_seconds=>120}

      story = Story.new(story_data)

      expect(story.validate_image_sound_keys).to be true

      story_data = {:user_id=>3511,
                    :title=>"Thoughts",
                    :body_text=>"hello world",
                    :word=>"test",
                    :image=>{"name"=>"william", "download_url"=>"http:test_url.com"},
                    :sound=>{"title"=>"denver skyline", "src"=>"http:beautifuldenver.com"},
                    :total_time_in_seconds=>120}

      story = Story.new(story_data)

      expect(story.validate_image_sound_keys).to be false
    end
  end
end
