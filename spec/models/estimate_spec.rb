# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Estimate, type: :model do
  let!(:estimate) { create(:estimate) }

  context 'when no items are present' do
    it 'is valid' do
      expect(estimate).to be_valid
    end

    it 'returns 0 for amounts' do
      expect(estimate.total_base_amount).to eq 0
      expect(estimate.total_vat_amount).to eq 0
      expect(estimate.total_with_tax).to eq 0
    end
  end

  context 'when items are present' do
    let!(:item) { create(:item, unit_price: 10, quantity: 1, vat_rate: 10, estimate: estimate) }
    let!(:item2) { create(:item, unit_price: 20, quantity: 3, vat_rate: 20, estimate: estimate) }

    it 'calculates total amounts' do
      expect(estimate.total_base_amount).to eq 70
      expect(estimate.total_vat_amount).to eq 30
      expect(estimate.total_with_tax).to eq 83
    end
  end
end
