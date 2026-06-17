class CreateOrderItemAddOns < ActiveRecord::Migration[8.1]
  def change
    create_table :order_item_add_ons do |t|
      t.timestamps
    end
  end
end
