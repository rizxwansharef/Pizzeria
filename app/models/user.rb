class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  enum :role, { owner: 0, order_taker: 1, delivery_person: 2 }
  validates :role, presence: true
  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } , presence: true, uniqueness: true
  validates :password,
            presence: true,
            length: { minimum: 8 },
            format: {
              with: /\A(?=.*[A-Z])(?=.*[^A-Za-z0-9]).{8,}\z/,
              message: "must include at least one uppercase letter and one special character"
            }


  has_many :orders
  has_many :deliveries, class_name: "Order", foreign_key: "delivery_person_id"
  has_many :taken_orders, class_name: "Order", foreign_key: "order_taker_id"
  
end
