require 'rails_helper'

RSpec.describe MetricPost do
  let(:data) {
    {
        "writing_id": 6,
        "word_count": 100,
        "time_spent": 80,
        "created_at": "2022-04-01T19:45:44.056287-06:00"
    }
  }
  let(:post) { MetricPost.new(data) }

  it 'exists with attributes' do
    expect(post).to be_a MetricPost

    expect(post.writing_id).to eq(6)
    expect(post.word_count).to eq(100)
    expect(post.time_spent).to eq(80)
    expect(post.date_created).to eq("2022-04-01T19:45:44.056287-06:00")
  end
end
