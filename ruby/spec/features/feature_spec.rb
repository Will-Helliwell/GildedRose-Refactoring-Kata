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
    expect(standard_item.sell_in).to eq(24)
    expect(aged_brie.sell_in).to eq(24)
    expect(backstage_pass.sell_in).to eq(24)
    expect(sulfuras.sell_in).to eq(25)
    expect(conjured.sell_in).to eq(24)
    expect(standard_item.quality).to eq(24)
    expect(aged_brie.quality).to eq(26)
    expect(backstage_pass.quality).to eq(26)
    expect(sulfuras.quality).to eq(25)
    expect(conjured.quality).to eq(23)
  end
end
