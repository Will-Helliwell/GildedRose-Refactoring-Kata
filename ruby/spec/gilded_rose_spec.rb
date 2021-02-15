# frozen_string_literal: true

require 'gilded_rose.rb'

describe GildedRose do

  let(:item_1) {double("fake item 1", :update_quality => "quality updated", :update_sell_in => "sell_in updated")}
  let(:item_2) {double("fake item 2", :update_quality => "quality updated", :update_sell_in => "sell_in updated")}
  let(:item_3) {double("fake item 3", :update_quality => "quality updated", :update_sell_in => "sell_in updated")}

  let(:gilded_rose) {described_class.new([item_1, item_2, item_3])}

  describe "#update_products" do
    it "updates the quality for each item" do
      expect(item_1).to receive(:update_quality)
      expect(item_2).to receive(:update_quality)
      expect(item_3).to receive(:update_quality)
      gilded_rose.update_products
    end
    it "updates the sell_in for each item" do
      expect(item_1).to receive(:update_sell_in)
      expect(item_2).to receive(:update_sell_in)
      expect(item_3).to receive(:update_sell_in)
      gilded_rose.update_products
    end
  end
end
