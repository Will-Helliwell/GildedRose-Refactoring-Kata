class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()

    @items.each do |item|
      case item.name
        when "Sulfuras, Hand of Ragnaros"
          break
        when "Aged Brie"
          item.quality += 1 if item.quality < 50
          item.sell_in -= 1
        when "Backstage passes to a TAFKAL80ETC concert"
          if item.sell_in <= 0
            item.quality = 0
          elsif item.sell_in >= 1 && item.sell_in <= 5
            item.quality += 3
          elsif item.sell_in >= 6 && item.sell_in <= 10
            item.quality += 2
          elsif item.sell_in > 10
            item.quality += 1
          end
          item.quality = 50 if item.quality > 50
          item.sell_in -= 1
        else
          if item.sell_in > 0 && item.quality > 0
            item.quality -=1
          elsif item.sell_in <= 0 && item.quality == 1
            item.quality -= 1
          elsif item.sell_in <= 0 && item.quality > 0
            item.quality -= 2
          end
          item.sell_in -= 1
      end
    end

  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
