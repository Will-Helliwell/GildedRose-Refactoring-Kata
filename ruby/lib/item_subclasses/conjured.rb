require_relative '../item.rb'

class Conjured < Item

  def update_quality
    if self.sell_in.positive? && self.quality > Item::MIN_QUALITY
      self.quality -= 2
    elsif self.sell_in <= 0 && self.quality > Item::MIN_QUALITY
      self.quality -= 4
    end
    self.quality = Item::MIN_QUALITY if self.quality < Item::MIN_QUALITY
  end
end
