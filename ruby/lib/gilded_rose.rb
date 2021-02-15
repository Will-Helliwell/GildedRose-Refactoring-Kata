# frozen_string_literal: true

require_relative './item.rb'

# Holds all the items in stock and can update their details
class GildedRose
  def initialize(items)
    @items = items
  end

  def update_products
    @items.each do |item|
      item.update_quality
      item.update_sell_in
    end
  end

end
