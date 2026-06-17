class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :pizza
    has_many :order_item_add_ons
    validates :pizza_id, presence: true
end
