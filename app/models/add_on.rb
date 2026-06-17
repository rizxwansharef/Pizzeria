class AddOn < ApplicationRecord
    validates :name, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

    has_many :order_item_add_ons
end
