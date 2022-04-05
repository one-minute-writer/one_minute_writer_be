require 'rails_helper'

RSpec.describe UserDashboardMetrics do
  let(:data) { {:total_words_all_time=>50, :total_time_all_time=>60, :average_words_per_minute=>74} }
  let(:metrics) { UserDashboardMetrics.new(data) }

  it 'exists with attributes' do
    expect(metrics).to be_a UserDashboardMetrics
    expect(metrics.total_words_all_time).to eq 50
    expect(metrics.total_time).to eq 60
    expect(metrics.average_words_per_minute).to eq 74
  end

end
