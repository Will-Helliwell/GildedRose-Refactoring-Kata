# frozen_string_literal: true

# Holds the data for each item
class Item
  MAX_QUALITY = 50
  MIN_QUALITY = 0

  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
