class Pizza < ApplicationRecord
    validates :name, presence: true
    serialize :variants, JSON , validate: true , presence: true
    
    has_many :order_items
end
