require 'conjured'

describe Conjured do

  it "responds to .new" do
    expect(described_class).to respond_to(:new)
  end

  describe "#update_quality" do
    before(:all) do
      items = []
      items << @conjured_1 = described_class.new('Conjured', 25, Item::MIN_QUALITY)
      items << @conjured_2 = described_class.new('Conjured', -10, Item::MIN_QUALITY)
      items << @conjured_3 = described_class.new('Conjured', Item::MAX_QUALITY, 2)
      items << @conjured_4 = described_class.new('Conjured', 10, Item::MAX_QUALITY)
      items << @conjured_5 = described_class.new('Conjured', 0, 10)
      items << @conjured_6 = described_class.new('Conjured', -10, 10)
      items.each do |item|
        item.update_quality
      end
    end
    it 'does not reduce the quality below Item::MIN_QUALITY' do
      expect(@conjured_1.quality).to eq(Item::MIN_QUALITY)
      expect(@conjured_2.quality).to eq(Item::MIN_QUALITY)
    end
    it 'reduces the quality by 2 when there are 1 or more days left to sell (and quality > 0)' do
      expect(@conjured_3.quality).to eq(0)
      expect(@conjured_4.quality).to eq(48)
    end
    it 'reduces the quality by 4 when sell_in has reached zero or below (and quality > 1)' do
      expect(@conjured_5.quality).to eq(6)
      expect(@conjured_6.quality).to eq(6)
    end
  end
end
