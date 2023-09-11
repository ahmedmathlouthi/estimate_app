# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:item)).to be_valid
  end

  context 'when vat rate in not in allowed vat rates' do
    let(:item) { build(:item, vat_rate: 30) }

    it 'throws error' do
      expect(item.save).to eq(false)
    end
  end

  context 'when item is saved' do
    let!(:valid_item) { create(:item, unit_price: 10, quantity: 2, vat_rate: 10) }

    it 'calculates price correctly' do
      expect(valid_item.total_price).to eq(20)
      expect(valid_item.total_price_with_vat).to eq(22)
    end
  end
end
