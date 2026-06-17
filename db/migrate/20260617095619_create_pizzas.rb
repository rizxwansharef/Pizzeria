class CreatePizzas < ActiveRecord::Migration[8.1]
  def change
    create_table :pizzas do |t|
      t.string :name, null: false
      t.text :description
      t.json :variants, null: false, default: {}
    end
  end
end
