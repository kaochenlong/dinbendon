class Order < ApplicationRecord
  attr_reader :nonce

  belongs_to :user
  has_many :order_items

  before_create :create_order_num

  private

  def create_order_num
    self.order_num = num_generator
  end

  def num_generator
    # 實作內容
    year = Date.today.year
    month = Date.today.month
    day = Date.today.day
    code = [*0..9, *'A'..'Z'].sample(6).join

    # 20200427A8E1E9
    "#{year}#{"%02d" % month}#{"%02d" % day}#{code}"
  end
end
