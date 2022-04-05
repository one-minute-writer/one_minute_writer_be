require 'rails_helper'

module Types
  RSpec.describe MetricsType do

    it 'returns the input given' do
      result = MetricsType.coerce_input(5, 'context')

      expect(result).to eq(5)
    end
  end
end
