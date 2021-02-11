
brie = Item.new("Aged Brie", 25, 100)
pass = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 100)
sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 100, 100)
misc = Item.new("misc", 25, 100)

items = [brie, pass, sulfuras, misc]

gr = GildedRose.new(items)
gr = GildedRose.new([brie])
gr = GildedRose.new([pass])
gr = GildedRose.new([misc])
