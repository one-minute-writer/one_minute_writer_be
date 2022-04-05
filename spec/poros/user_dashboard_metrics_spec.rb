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

  describe 'instance methods' do
    describe 'hours_minutes_and_seconds' do
      it 'turns the total_time variable into a string of hours, minutes, and seconds' do
        expect(metrics.hours_minutes_and_seconds).to eq('00:01:00')
      end

      it 'works for larger numbers' do
        metrics_1 = UserDashboardMetrics.new({:total_words_all_time=>50, :total_time_all_time=>789000})
        expect(metrics_1.hours_minutes_and_seconds).to eq("219:10:00")
      end
    end
  end
end
