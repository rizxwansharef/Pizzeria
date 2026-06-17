class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.string :customer_name, null: false
      t.string :customer_address, null: false
      t.string :customer_phone, null: false 
      t.integer :status, null: false, default: 0
      t.integer :order_type, null: false, default: 0
      t.integer :order_taker_id, null: false
      t.integer :delivery_person_id
      t.decimal :total_price, precision: 10, scale: 2, null: false
      
      t.timestamps
    end
  end
end
