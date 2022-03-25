require 'rails_helper'

RSpec.describe Story, type: :model do

  it 'exists' do
    user = create(:story)
    expect(user).to be_a Story
  end

  describe 'validations' do

  end
end
