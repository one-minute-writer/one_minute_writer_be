require 'rails_helper'

RSpec.describe DashboardMetricsService do
  describe "class methods" do
    describe "get_writing_metrics" do
      it 'returns aggregated dashboard metrics data for provided ids' do
        metrics_get_response = File.read('./spec/support/stubbed_api_responses/dashboard_metrics_get_response.json')

        stub_request(:get, "https://enigmatic-oasis-75046.herokuapp.com/dashboard?writing_ids=1").to_return(body: metrics_get_response, status: 200)

        metrics = DashboardMetricsService.get_writing_metrics('1')

        expect(metrics).to be_a Hash

        expect(metrics).to have_key(:total_words_all_time)
        expect(metrics[:total_words_all_time]).to be_a Integer

        expect(metrics).to have_key(:total_time_all_time)
        expect(metrics[:total_time_all_time]).to be_a Integer
      end

      it 'returns aggregated dashboard metrics data for provided ids when more than one ID' do
        metrics_get_response = File.read('./spec/support/stubbed_api_responses/dashboard_metrics_multiple_ids_get_response.json')

        stub_request(:get, "https://enigmatic-oasis-75046.herokuapp.com/dashboard?writing_ids=5,6").to_return(body: metrics_get_response, status: 200)

        metrics = DashboardMetricsService.get_writing_metrics('5,6')

        expect(metrics).to be_a Hash

        expect(metrics).to have_key(:total_words_all_time)
        expect(metrics[:total_words_all_time]).to be_a Integer

        expect(metrics).to have_key(:total_time_all_time)
        expect(metrics[:total_time_all_time]).to be_a Integer
      end
    end

    describe 'post_writing_metrics' do
      it 'sends writing data and persists to BE databse' do
        metrics_post_response = File.read('./spec/support/stubbed_api_responses/dashboard_metrics_post_response.json')

        stub_request(:post, "https://enigmatic-oasis-75046.herokuapp.com/dashboard?total_time=80&word_count=100&writing_id=6").to_return(body: metrics_post_response, status: 201)

        metrics = DashboardMetricsService.post_writing_metrics(6, 100, 80)

        expect(metrics).to be_a Hash
        expect(metrics).to have_key(:writing_id)
        expect(metrics[:writing_id]).to be_a Integer

        expect(metrics).to have_key(:word_count)
        expect(metrics[:word_count]).to be_a Integer

        expect(metrics).to have_key(:time_spent)
        expect(metrics[:time_spent]).to be_a Integer

        expect(metrics).to have_key(:created_at)
      end
    end
  end
end
