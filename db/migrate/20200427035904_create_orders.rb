class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :order_num
      t.string :receiver
      t.string :phone
      t.string :address
      t.string :state

      t.timestamps
    end
  end
end
