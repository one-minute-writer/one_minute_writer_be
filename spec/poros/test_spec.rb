require 'rails_helper'

RSpec.describe Test do
  it 'exists with attribute' do
    test = Test.new("Test")

    expect(test).to be_a Test
    expect(test.data).to eq("Test")
  end
end
