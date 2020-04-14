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

  def total
    result = @items.sum { |item| item.total }

    # 4/1 全館打 1 折
    if Time.now.month == 4 and Time.now.day == 1
      result = result * 0.1
    end

    return result

    # @items.reduce(0) { |sum, item| sum + item.total }

    # tmp = 0
    # @items.each do |item|
    #   tmp += item.total
    # end
    #
    # return tmp
  end

  def to_hash
    # items = []

    # @items.each do |item|
    #   items << { "item_id" => item.item_id, 
    #              "quantity" => item.quantity }
    # end
    items = @items.map { |item|  
      { "item_id" => item.item_id, "quantity" => item.quantity } 
    }

    return { "items" => items }
  end
end

