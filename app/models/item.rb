class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image

  validates :user, presence: true
  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :situation_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :address_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :day_id, numericality: { other_than: 1, message: "can't be blank"} 
    with_options presence: true, format: { with: /\A[0-9]+\z/ } do
      validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                presence: { message: "can't be blank" }
    end
  belongs_to :user
  has_one :purchase_history
end
