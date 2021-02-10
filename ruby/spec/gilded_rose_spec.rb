require 'gilded_rose.rb'

describe GildedRose do

  describe "#update_quality" do

    it "does not change the names of items" do
      items = [Item.new("foo", 0, 0), Item.new("Aged Brie", 25, 25), Item.new("Sulfuras, Hand of Ragnaros", 100, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
      expect(items[1].name).to eq "Aged Brie"
      expect(items[2].name).to eq "Sulfuras, Hand of Ragnaros"
    end

    context "given Sulfuras, Hand of Ragnaros" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 100, 50), Item.new("Sulfuras, Hand of Ragnaros", 0, 0), Item.new("Sulfuras, Hand of Ragnaros", 10, 10)]
      GildedRose.new(items).update_quality()
      it "does not change the sell_in" do
        expect(items[0].sell_in).to eq(100)
        expect(items[1].sell_in).to eq(0)
        expect(items[2].sell_in).to eq(10)
      end
      it "does not change the quality" do
        expect(items[0].quality).to eq(50)
        expect(items[1].quality).to eq(0)
        expect(items[2].quality).to eq(10)
      end
    end

    context "given Aged Brie" do
      items = [Item.new("Aged Brie", 25, 25)]
      items << Item.new("Aged Brie", 9, 0)
      items << Item.new("Aged Brie", 0, 49)
      guilded_rose = GildedRose.new(items)
      guilded_rose.update_quality()
      it "reduces the sell_in by 1 at all times" do
        expect(items[0].sell_in).to eq(24)
        expect(items[1].sell_in).to eq(8)
        expect(items[2].sell_in).to eq(-1)
      end
      it "increases the quality by 1 when quality < 50" do
        expect(items[0].quality).to eq(26)
        expect(items[1].quality).to eq(1)
        expect(items[2].quality).to eq(50)
      end
      it "does not increase the quality above 50" do
        100.times{guilded_rose.update_quality()}
        expect(items[2].quality).to eq(50)
      end
    end

  end

end
