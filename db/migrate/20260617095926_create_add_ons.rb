class CreateAddOns < ActiveRecord::Migration[8.1]
  def change
    create_table :add_ons do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :price, null: false
    end
  end
end
