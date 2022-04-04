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
  end
end
