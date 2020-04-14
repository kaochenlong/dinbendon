class Cart
  def initialize
    @items = []
  end

  def add_item(item_id)
    found_item = @items.find { |item| item.item_id == item_id }

    if found_item
      found_item.increment!   # 增加數量
    else
      @items << CartItem.new(item_id)
    end
  end

  def empty?
    @items.empty?
  end

  def items
    @items
  end
end

