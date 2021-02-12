require_relative './item.rb'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_products()
    update_quality()
    update_sell_in()
  end

  private
  def update_quality()
    @items.each do |item|
      case item.name
        when "Sulfuras, Hand of Ragnaros"
          break
        when "Aged Brie"
          item.quality += 1 if item.quality < Item::MAX_QUALITY
        when "Backstage passes to a TAFKAL80ETC concert"
          if item.sell_in <= 0
            item.quality = Item::MIN_QUALITY
          elsif item.sell_in >= 1 && item.sell_in <= 5
            item.quality += 3
          elsif item.sell_in >= 6 && item.sell_in <= 10
            item.quality += 2
          elsif item.sell_in > 10
            item.quality += 1
          end
          item.quality = Item::MAX_QUALITY if item.quality > Item::MAX_QUALITY
        when "Conjured"
          update_quality_for_misc(item, base_degredation_rate: 2)
        else
          update_quality_for_misc(item, base_degredation_rate: 1)
      end
    end
  end
  def update_quality_for_misc(item, base_degredation_rate:)
    if item.sell_in > 0 && item.quality > Item::MIN_QUALITY
      item.quality -= base_degredation_rate
    elsif item.sell_in <= 0 && item.quality > Item::MIN_QUALITY
      item.quality -= base_degredation_rate * 2
    end
    item.quality = Item::MIN_QUALITY if item.quality < Item::MIN_QUALITY
  end
  def update_sell_in()
    @items.each do |item|
      item.sell_in -= 1 unless item.name == "Sulfuras, Hand of Ragnaros"
    end
  end
end
