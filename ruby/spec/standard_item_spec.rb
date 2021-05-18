require 'item_subclasses/standard_item'

describe StandardItem do

  it "responds to .new" do
    expect(described_class).to respond_to(:new)
  end

  describe "#update_quality" do
    before(:all) do
      items = []
      items << @standard_item_1 = StandardItem.new('misc', 25, Item::MIN_QUALITY)
      items << @standard_item_2 = StandardItem.new('misc', -10, Item::MIN_QUALITY)
      items << @standard_item_3 = StandardItem.new('misc', Item::MAX_QUALITY, 1)
      items << @standard_item_4 = StandardItem.new('misc', 10, Item::MAX_QUALITY)
      items << @standard_item_5 = StandardItem.new('misc', 0, 10)
      items << @standard_item_6 = StandardItem.new('misc', -10, 10)
      items << @standard_item_7 = StandardItem.new('misc', -10, 1)
      items.each do |item|
        item.update_quality
      end
    end
    it 'does not reduce the quality below Item::MIN_QUALITY' do
      expect(@standard_item_1.quality).to eq(Item::MIN_QUALITY)
      expect(@standard_item_2.quality).to eq(Item::MIN_QUALITY)
    end
    it 'reduces the quality by 1 when there are 1 or more days left to sell (and quality > 0)' do
      expect(@standard_item_3.quality).to eq(0)
      expect(@standard_item_4.quality).to eq(49)
    end
    it 'reduces the quality by 2 when sell_in has reached zero or below (and quality > 1)' do
      expect(@standard_item_5.quality).to eq(8)
      expect(@standard_item_6.quality).to eq(8)
    end
    it 'reduces the quality by 1 when sell_in has reached zero or below (and quality == 1)' do
      expect(@standard_item_7.quality).to eq(0)
    end
  end
end
