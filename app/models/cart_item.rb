class CartItem
  attr_reader :item_id, :quantity

  def initialize(item_id, quantity = 1)
    @item_id = item_id
    @quantity = quantity
  end

  def increment!(amount = 1)
    @quantity += amount
  end

  def item
    Item.find(@item_id)
  end

  def total
    item.price * @quantity
  end
end
