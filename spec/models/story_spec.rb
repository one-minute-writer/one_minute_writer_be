require 'rails_helper'

RSpec.describe Story, type: :model do

  it 'exists' do
    story = create(:story)
    expect(story).to be_a Story
  end

  describe 'validations' do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :total_time }
    it { should validate_presence_of :body_text }
    it { should validate_presence_of :image }
    it { should validate_presence_of :words }
    it { should validate_presence_of :sound }
  end
end
