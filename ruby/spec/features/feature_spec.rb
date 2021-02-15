require 'gilded_rose'

describe "FATURE TEST - Gilded Rose" do
  it "updates the quality and sell_in correctly for every item" do
    items = []
    items << standard_item = StandardItem.new("standard", 25, 25)
    items << aged_brie = AgedBrie.new("aged brie", 25, 25)
    items << backstage_pass = BackstagePass.new("backstage pass", 25, 25)
    items << sulfuras = Sulfuras.new("sulfuras", 25, 25)
    items << conjured = Conjured.new("conjured", 25, 25)
    gilded_rose = GildedRose.new(items)
    gilded_rose.update_products
    
  end
end
