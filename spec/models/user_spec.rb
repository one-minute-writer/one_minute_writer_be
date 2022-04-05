require 'rails_helper'

RSpec.describe User, type: :model do

  it 'exists' do
    user = create(:user)
    expect(user).to be_a User
  end

  describe 'validations' do
    it { should have_many(:stories).dependent(:destroy) }
    it { should validate_presence_of :username }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
  end

  describe 'instance methods', :vcr do
    it '#update_metrics' do
      user = create(:user)
      create(:story, id: 5, user_id: user.id)

      expect(user.dashboard_metrics).to eq({})

      user.update_metrics

      expect(user.dashboard_metrics).to have_key(:total_words_all_time)
      expect(user.dashboard_metrics).to have_key(:total_time)
      expect(user.dashboard_metrics).to have_key(:average_words_per_minute)
    end
  end

end
