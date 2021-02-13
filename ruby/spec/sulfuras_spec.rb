require 'sulfuras'

describe Sulfuras do

  it "responds to .new" do
    expect(described_class).to respond_to(:new)
  end

  describe "#update_quality" do
    before(:all) do
      @sulfuras_1 = described_class.new('Sulfuras, Hand of Ragnaros', 100, Item::MAX_QUALITY)
      @sulfuras_2 = described_class.new('Sulfuras, Hand of Ragnaros', 0, 0)
      @sulfuras_3 = described_class.new('Sulfuras, Hand of Ragnaros', 10, 10)
      items = [@sulfuras_1, @sulfuras_2, @sulfuras_3]
      items.each{ |item| item.update_quality }
    end
    it 'does not change the quality' do
      expect(@sulfuras_1.quality).to eq(Item::MAX_QUALITY)
      expect(@sulfuras_2.quality).to eq(0)
      expect(@sulfuras_3.quality).to eq(10)
    end
  end

  describe "#update_sell_in" do
    before(:all) do
      @sulfuras_1 = described_class.new('Sulfuras, Hand of Ragnaros', 100, Item::MAX_QUALITY)
      @sulfuras_2 = described_class.new('Sulfuras, Hand of Ragnaros', 0, 0)
      @sulfuras_3 = described_class.new('Sulfuras, Hand of Ragnaros', 10, 10)
      items = [@sulfuras_1, @sulfuras_2, @sulfuras_3]
      items.each{ |item| item.update_sell_in }
    end
    it 'does not change the sell_in' do
      expect(@sulfuras_1.sell_in).to eq(100)
      expect(@sulfuras_2.sell_in).to eq(0)
      expect(@sulfuras_3.sell_in).to eq(10)
    end
  end

end
