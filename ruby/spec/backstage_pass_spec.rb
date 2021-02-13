require 'backstage_pass'

describe BackstagePass do

  it "responds to .new" do
    expect(described_class).to respond_to(:new)
  end

  describe "#update_quality" do
    before(:all) do
      items = []
      items << @pass_1 = described_class.new('Backstage passes to a TAFKAL80ETC concert', 10, 25)
      items << @pass_2 = described_class.new('Backstage passes to a TAFKAL80ETC concert', 6, 25)
      items << @pass_3 = described_class.new('Backstage passes to a TAFKAL80ETC concert', 5, 25)
      items << @pass_4 = described_class.new('Backstage passes to a TAFKAL80ETC concert', 1, 25)
      items << @pass_5 = described_class.new('Backstage passes to a TAFKAL80ETC concert', 0, 25)
      items << @pass_6 = described_class.new('Backstage passes to a TAFKAL80ETC concert', 11, 25)
      items << @pass_7 = described_class.new('Backstage passes to a TAFKAL80ETC concert', 25, 25)
      items << @pass_8 = described_class.new('Backstage passes to a TAFKAL80ETC concert', 100, 25)
      items << @pass_9 = described_class.new('Backstage passes to a TAFKAL80ETC concert', 50, Item::MAX_QUALITY)
      items << @pass_10 = described_class.new('Backstage passes to a TAFKAL80ETC concert', 6, Item::MAX_QUALITY)
      items << @pass_11 = described_class.new('Backstage passes to a TAFKAL80ETC concert', 1, Item::MAX_QUALITY)
      items.each do |item|
        item.update_quality
      end
    end
    it 'increases the quality by 1 if sell_in is already > 10' do
      expect(@pass_6.quality).to eq(26)
      expect(@pass_7.quality).to eq(26)
      expect(@pass_8.quality).to eq(26)
    end
    it 'increases the quality by 2 when 6 <= sell_in <= 10' do
      expect(@pass_1.quality).to eq(27)
      expect(@pass_2.quality).to eq(27)
    end
    it 'increases the quality by 3 when 1 <= sell_in <= 5' do
      expect(@pass_3.quality).to eq(28)
      expect(@pass_4.quality).to eq(28)
    end
    it 'drops the quality to Item::MIN_QUALITY when sell_in is already zero' do
      expect(@pass_5.quality).to eq(Item::MIN_QUALITY)
    end
    it 'does not increase the quality above Item::MAX_QUALITY' do
      expect(@pass_9.quality).to eq(Item::MAX_QUALITY)
      expect(@pass_10.quality).to eq(Item::MAX_QUALITY)
      expect(@pass_11.quality).to eq(Item::MAX_QUALITY)
    end
  end
end
