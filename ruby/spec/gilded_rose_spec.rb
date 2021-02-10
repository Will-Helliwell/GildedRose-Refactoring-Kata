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
      items = [Item.new("Sulfuras, Hand of Ragnaros", 100, 50)]
      GildedRose.new(items).update_quality()
      it "does not change the sell_in" do
        expect(items[0].sell_in).to eq(100)
      end
    end

  end

end
