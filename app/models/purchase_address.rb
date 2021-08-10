class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :block, :building_name, :phone_number, :prefecture_id, :user_id, :item_id
 
  with_options presence: true do
    validates :city, :block, :user_id, :item_id
    validates :prefecture_id,numericality: { other_than: 1, message: "can't be blank" }
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A(0{1}\d{9,10})\z/, message: "is too short"}
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, city: city, block: block, building_name: building_name, phone_number: phone_number, prefecture_id: prefecture_id,purchase_id: purchase.id)
  end
end