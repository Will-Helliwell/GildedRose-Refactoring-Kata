require_relative './item.rb'

class AgedBrie < Item

  def update_quality
    self.quality += 1 if self.quality < Item::MAX_QUALITY
  end

end
