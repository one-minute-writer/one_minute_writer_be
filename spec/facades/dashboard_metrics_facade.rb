require 'rails_helper'

RSpec.describe DashboardMetricsFacade do
  describe 'class methods' do
    describe 'get_writing_metrics' do
      it 'returns one dashboard metrics object' do
        metrics_get_response = File.read('./spec/support/stubbed_api_responses/dashboard_metrics_get_response.json')

        stub_request(:get, "https://enigmatic-oasis-75046.herokuapp.com/dashboard?writing_ids=1").to_return(body: metrics_get_response, status: 200)

        metrics = DashboardMetricsFacade.get_writing_metrics('1')

        expect(metrics).to be_a UserDashboardMetrics
      end
    end

    describe 'post_writing_metrics' do
      it 'creates a chunked writing data on the python API and returns the newly posted information' do
        metrics_post_response = File.read('./spec/support/stubbed_api_responses/dashboard_metrics_post_response.json')

        stub_request(:post, "https://enigmatic-oasis-75046.herokuapp.com/dashboard?total_time=80&word_count=100&writing_id=6").to_return(body: metrics_post_response, status: 201)

        created_post = DashboardMetricsFacade.post_writing_metrics(6, 100, 80)

        expect(created_post).to be_a MetricPost
      end
    end
  end
end
