class PurchaseSend
  include ActiveModel::Model

  attr_accessor :post_code, :prefecture_id, :city_name, :street_address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city_name
    validates :street_address
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/}
    validates :user_id
    validates :item_id
  end

    def save
      send = Send.create(user_id: user_id, item_id: item_id)

      PurchaseHistory.create(post_code: post_code, prefecture_id: prefecture_id, city_name: city_name, street_address: street_address, building: building, phone_number: phone_number, send_id: send.id)
    end
end