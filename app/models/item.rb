class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_day
  belongs_to :shipping_fee
  belongs_to :prefecture

  with_options presence: true do
    validates :product_name, :text, :image
    validates :category_id, :condition_id, :shipping_day_id, :shipping_fee_id, :prefecture_id,
              numericality: { other_than: 1, message: "can't be blank" }
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
    validates :price, inclusion: { in: 300..9_999_999, message: 'out of setting range' }
  end
end
