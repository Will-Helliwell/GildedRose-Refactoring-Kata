
brie = Item.new("Aged Brie", 25, 25)
pass = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 0)
sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 100, 25)
items = [brie, pass, sulfuras]

gr = GildedRose.new(items)
gr = GildedRose.new([brie])
gr = GildedRose.new([pass])
