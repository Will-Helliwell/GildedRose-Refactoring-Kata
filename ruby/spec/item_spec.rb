require 'item'

describe Item do

  it "responds to .new" do
    expect(described_class).to respond_to(:new)
  end

  describe "#update_sell_in" do
    before(:all) do
      items = []
      items << @item_1 = Item.new('misc', 25, Item::MIN_QUALITY) # index 0
      items << @item_2 = Item.new('misc', -10, Item::MIN_QUALITY) # index 1
      items << @item_3 = Item.new('misc', 50, 1) # index 2
      items << @item_4 = Item.new('misc', 10, Item::MAX_QUALITY) # index 3
      items << @item_5 = Item.new('misc', 0, 10) # index 4
      items << @item_6 = Item.new('misc', 1000, 10) # index 5
      items << @item_7 = Item.new('misc', -1000, 1) # index 6
      items.each do |item|
        item.update_sell_in
      end
    end
    it "reduces the sell_in by 1 at all times" do
      expect(@item_1.sell_in).to eq(24)
      expect(@item_2.sell_in).to eq(-11)
      expect(@item_3.sell_in).to eq(49)
      expect(@item_4.sell_in).to eq(9)
      expect(@item_5.sell_in).to eq(-1)
      expect(@item_6.sell_in).to eq(999)
      expect(@item_7.sell_in).to eq(-1001)
    end
  end

end
