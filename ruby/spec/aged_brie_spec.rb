require 'aged_brie'
require 'gilded_rose'

describe AgedBrie do

  it "responds to .new" do
    expect(described_class).to respond_to(:new)
  end

  describe "#update_quality" do
    before(:all) do
      items = []
      items << @brie_1 = AgedBrie.new('Aged Brie', 25, 25)
      items << @brie_2 = AgedBrie.new('Aged Brie', 9, 0)
      items << @brie_3 = AgedBrie.new('Aged Brie', 0, 49)
      items << @brie_4 = AgedBrie.new('Aged Brie', 25, Item::MAX_QUALITY)
      items.each do |item|
        item.update_quality
      end
    end
    it 'increases the quality by 1 when quality < Item::MAX_QUALITY' do
      expect(@brie_1.quality).to eq(26)
      expect(@brie_2.quality).to eq(1)
      expect(@brie_3.quality).to eq(Item::MAX_QUALITY)
    end
    it 'does not increase the quality above Item::MAX_QUALITY' do
      expect(@brie_4.quality).to eq(Item::MAX_QUALITY)
    end
  end
end
