require 'rails_helper'

RSpec.describe User, type: :model do

  it 'exists' do
    user = create(:user)
    expect(user).to be_a User
  end

  describe 'validations' do
    it { should have_many :stories }
    it { should validate_presence_of :username }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
  end

end
