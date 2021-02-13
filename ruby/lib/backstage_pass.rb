require_relative './item.rb'

class BackstagePass < Item

  def update_quality
    if self.sell_in <= 0
      self.quality = Item::MIN_QUALITY
    elsif self.sell_in.between?(1, 5)
      self.quality += 3
    elsif self.sell_in.between?(6, 10)
      self.quality += 2
    elsif self.sell_in > 10
      self.quality += 1
    end
    self.quality = Item::MAX_QUALITY if self.quality > Item::MAX_QUALITY
  end
end
