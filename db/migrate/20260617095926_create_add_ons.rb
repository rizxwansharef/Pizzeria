class CreateAddOns < ActiveRecord::Migration[8.1]
  def change
    create_table :add_ons do |t|
      t.timestamps
    end
  end
end
