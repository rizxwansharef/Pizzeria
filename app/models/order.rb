class Order < ApplicationRecord
    validates :customer_name, presence: true
    validates :customer_address, presence: true
    validates :customer_phone, presence: true
    enum :type, { dine_in: 0, takeout: 1, delivery: 2 }
    validates :type, presence: true
    enum :status, { pending: 0, in_progress: 1, cancelled: 2, ready: 3, out_for_serving: 4, out_for_pickup: 5, out_for_delivery: 6, completed: 7 }
    validates :status, presence: true
    validates :total_price, presence: true, numericality: { greater_than: 0 }
    validates :order_taker_id, presence: true
    validates :delivery_person_id, presence: true, if: -> { delivery? }
    
    belongs_to :order_taker, class_name: "User", foreign_key: "order_taker_id"
    belongs_to :delivery_person, class_name: "User", foreign_key: "delivery_person_id", optional: true
    has_many :order_items
    has_one_attached :delivery_proof_image, if: -> { delivery? }
end
