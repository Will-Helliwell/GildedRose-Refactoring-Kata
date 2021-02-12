require 'sulfuras'

describe Sulfuras do

  it "responds to .new" do
    expect(described_class).to respond_to(:new)
  end

  describe "#update_quality" do
    items = [described_class.new('Sulfuras, Hand of Ragnaros', 100, Item::MAX_QUALITY)]
    items << described_class.new('Sulfuras, Hand of Ragnaros', 0, 0)
    items << described_class.new('Sulfuras, Hand of Ragnaros', 10, 10)
    GildedRose.new(items).update_products
    it 'does not change the sell_in' do
      expect(items[0].sell_in).to eq(100)
      expect(items[1].sell_in).to eq(0)
      expect(items[2].sell_in).to eq(10)
    end
    it 'does not change the quality' do
      expect(items[0].quality).to eq(Item::MAX_QUALITY)
      expect(items[1].quality).to eq(0)
      expect(items[2].quality).to eq(10)
    end
  end

end
