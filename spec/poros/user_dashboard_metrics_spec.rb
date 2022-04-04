require 'rails_helper'

RSpec.describe UserDashboardMetrics do
  let(:data) { {:total_words_all_time=>50, :total_time_all_time=>60} }
  let(:metrics) { UserDashboardMetrics.new(data) }

  it 'exists with attributes' do
    expect(metrics).to be_a UserDashboardMetrics
    expect(metrics.total_words_all_time).to eq 50
    expect(metrics.total_time).to eq 60
  end

  describe 'instance methods' do
    describe 'number_of_minutes' do
      it 'returns 1 for 60 seconds' do
        expect(metrics.number_of_minutes).to eq(1.0)
        expect(metrics.number_of_minutes).to be_a Float
      end

      it 'returns 3 for 180' do
        metrics_1 = UserDashboardMetrics.new({:total_words_all_time=>50, :total_time_all_time=>180})

        expect(metrics_1.number_of_minutes).to eq(3.0)
        expect(metrics_1.number_of_minutes).to be_a Float
      end

      it 'returns float rounded to 2 point for 275' do
        metrics_1 = UserDashboardMetrics.new({:total_words_all_time=>50, :total_time_all_time=>275})

        expect(metrics_1.number_of_minutes).to eq(4.58)
        expect(metrics_1.number_of_minutes).to be_a Float
      end
    end

    describe 'avg_words_per_min' do
      it 'returns the avgerage words per minute for all time' do
        expect(metrics.avg_words_per_min).to eq(metrics.total_words_all_time.to_f / metrics.number_of_minutes.to_f)
      end
    end

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
