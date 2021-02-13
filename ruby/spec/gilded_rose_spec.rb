# frozen_string_literal: true

require 'gilded_rose.rb'

describe GildedRose do
  # describe '#update_products' do
  #   it 'does not change the names of items' do
  #     items = [Item.new('foo', 0, 0)]
  #     items << Item.new('Aged Brie', 25, 25)
  #     items << Item.new('Sulfuras, Hand of Ragnaros', 100, Item::MAX_QUALITY)
  #     GildedRose.new(items).update_products
  #     expect(items[0].name).to eq 'foo'
  #     expect(items[1].name).to eq 'Aged Brie'
  #     expect(items[2].name).to eq 'Sulfuras, Hand of Ragnaros'
  #   end
  #
  #   context 'given Sulfuras, Hand of Ragnaros' do
  #     items = [Item.new('Sulfuras, Hand of Ragnaros', 100, Item::MAX_QUALITY)]
  #     items << Item.new('Sulfuras, Hand of Ragnaros', 0, 0)
  #     items << Item.new('Sulfuras, Hand of Ragnaros', 10, 10)
  #     GildedRose.new(items).update_products
  #     it 'does not change the sell_in' do
  #       expect(items[0].sell_in).to eq(100)
  #       expect(items[1].sell_in).to eq(0)
  #       expect(items[2].sell_in).to eq(10)
  #     end
  #     it 'does not change the quality' do
  #       expect(items[0].quality).to eq(Item::MAX_QUALITY)
  #       expect(items[1].quality).to eq(0)
  #       expect(items[2].quality).to eq(10)
  #     end
  #   end
  #
  #   context 'given Aged Brie' do
  #     items = [Item.new('Aged Brie', 25, 25)]
  #     items << Item.new('Aged Brie', 9, 0)
  #     items << Item.new('Aged Brie', 0, 49)
  #     items << Item.new('Aged Brie', 25, Item::MAX_QUALITY)
  #     guilded_rose = GildedRose.new(items)
  #     guilded_rose.update_products
  #     it 'increases the quality by 1 when quality < Item::MAX_QUALITY' do
  #       expect(items[0].quality).to eq(26)
  #       expect(items[1].quality).to eq(1)
  #       expect(items[2].quality).to eq(Item::MAX_QUALITY)
  #     end
  #     it 'does not increase the quality above Item::MAX_QUALITY' do
  #       expect(items[3].quality).to eq(Item::MAX_QUALITY)
  #     end
  #     it 'reduces the sell_in by 1 at all times' do
  #       expect(items[0].sell_in).to eq(24)
  #       expect(items[1].sell_in).to eq(8)
  #       expect(items[2].sell_in).to eq(-1)
  #     end
  #   end
  #
  #   context "given 'Backstage passes to a TAFKAL80ETC concert'" do
  #     items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 25)] # index 0
  #     items << Item.new('Backstage passes to a TAFKAL80ETC concert', 6, 25) # index 1
  #     items << Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 25) # index 2
  #     items << Item.new('Backstage passes to a TAFKAL80ETC concert', 1, 25) # index 3
  #     items << Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 25) # index 4
  #     items << Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 25) # index 5
  #     items << Item.new('Backstage passes to a TAFKAL80ETC concert', 25, 25) # index 6
  #     items << Item.new('Backstage passes to a TAFKAL80ETC concert', 100, 25) # index 7
  #     items << Item.new('Backstage passes to a TAFKAL80ETC concert', 50, Item::MAX_QUALITY) # index 8
  #     items << Item.new('Backstage passes to a TAFKAL80ETC concert', 6, Item::MAX_QUALITY) # index 9
  #     items << Item.new('Backstage passes to a TAFKAL80ETC concert', 1, Item::MAX_QUALITY) # index 10
  #     guilded_rose = GildedRose.new(items)
  #     guilded_rose.update_products
  #     it 'increases the quality by 1 if sell_in is already > 10' do
  #       expect(items[5].quality).to eq(26)
  #       expect(items[6].quality).to eq(26)
  #       expect(items[7].quality).to eq(26)
  #     end
  #     it 'increases the quality by 2 when 6 <= sell_in <= 10' do
  #       expect(items[0].quality).to eq(27)
  #       expect(items[1].quality).to eq(27)
  #     end
  #     it 'increases the quality by 3 when 1 <= sell_in <= 5' do
  #       expect(items[2].quality).to eq(28)
  #       expect(items[3].quality).to eq(28)
  #     end
  #     it 'drops the quality to Item::MIN_QUALITY when sell_in is already zero' do
  #       expect(items[4].quality).to eq(Item::MIN_QUALITY)
  #     end
  #     it 'does not increase the quality above Item::MAX_QUALITY' do
  #       expect(items[8].quality).to eq(Item::MAX_QUALITY)
  #       expect(items[9].quality).to eq(Item::MAX_QUALITY)
  #       expect(items[10].quality).to eq(Item::MAX_QUALITY)
  #     end
  #     it 'reduces the sell_in by 1 at all times' do
  #       expect(items[0].sell_in).to eq(9)
  #       expect(items[1].sell_in).to eq(5)
  #       expect(items[2].sell_in).to eq(4)
  #       expect(items[3].sell_in).to eq(0)
  #       expect(items[4].sell_in).to eq(-1)
  #     end
  #   end
  #
  #   context 'given a Conjured item' do
  #     items = [Item.new('Conjured', 25, Item::MIN_QUALITY)] # index 0
  #     items << Item.new('Conjured', -10, Item::MIN_QUALITY) # index 1
  #     items << Item.new('Conjured', Item::MAX_QUALITY, 2) # index 2
  #     items << Item.new('Conjured', 10, Item::MAX_QUALITY) # index 3
  #     items << Item.new('Conjured', 0, 10) # index 4
  #     items << Item.new('Conjured', -10, 10) # index 5
  #     items << Item.new('Conjured', -10, 1) # index 6
  #     guilded_rose = GildedRose.new(items)
  #     guilded_rose.update_products
  #     it 'does not reduce the quality below Item::MIN_QUALITY' do
  #       expect(items[0].quality).to eq(Item::MIN_QUALITY)
  #       expect(items[1].quality).to eq(Item::MIN_QUALITY)
  #     end
  #     it 'reduces the quality by 2 when there are 1 or more days left to sell (and quality > 0)' do
  #       expect(items[2].quality).to eq(0)
  #       expect(items[3].quality).to eq(48)
  #     end
  #     it 'reduces the quality by 4 when sell_in has reached zero or below (and quality > 1)' do
  #       expect(items[4].quality).to eq(6)
  #       expect(items[5].quality).to eq(6)
  #     end
  #     it 'reduces the sell_in by 1 at all times' do
  #       expect(items[0].sell_in).to eq(24)
  #       expect(items[2].sell_in).to eq(49)
  #       expect(items[3].sell_in).to eq(9)
  #       expect(items[4].sell_in).to eq(-1)
  #     end
  #   end
  #
  #   context 'given a misc item' do
  #     items = [Item.new('misc', 25, Item::MIN_QUALITY)] # index 0
  #     items << Item.new('misc', -10, Item::MIN_QUALITY) # index 1
  #     items << Item.new('misc', Item::MAX_QUALITY, 1) # index 2
  #     items << Item.new('misc', 10, Item::MAX_QUALITY) # index 3
  #     items << Item.new('misc', 0, 10) # index 4
  #     items << Item.new('misc', -10, 10) # index 5
  #     items << Item.new('misc', -10, 1) # index 6
  #     guilded_rose = GildedRose.new(items)
  #     guilded_rose.update_products
  #     it 'does not reduce the quality below Item::MIN_QUALITY' do
  #       expect(items[0].quality).to eq(Item::MIN_QUALITY)
  #       expect(items[1].quality).to eq(Item::MIN_QUALITY)
  #     end
  #     it 'reduces the quality by 1 when there are 1 or more days left to sell (and quality > 0)' do
  #       expect(items[2].quality).to eq(0)
  #       expect(items[3].quality).to eq(49)
  #     end
  #     it 'reduces the quality by 2 when sell_in has reached zero or below (and quality > 1)' do
  #       expect(items[4].quality).to eq(8)
  #       expect(items[5].quality).to eq(8)
  #     end
  #     it 'reduces the quality by 1 when sell_in has reached zero or below (and quality == 1)' do
  #       expect(items[6].quality).to eq(0)
  #     end
  #     it 'reduces the sell_in by 1 at all times' do
  #       expect(items[0].sell_in).to eq(24)
  #       expect(items[2].sell_in).to eq(49)
  #       expect(items[3].sell_in).to eq(9)
  #       expect(items[4].sell_in).to eq(-1)
  #     end
  #   end
  # end
end
