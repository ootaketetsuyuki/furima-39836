class CreatePurchaseHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_histories do |t|
      t.references  :send,            null: false, foreign_key: true
      t.string      :post_code,       null: false
      t.integer     :prefecture_id,   null: false
      t.string      :city_name,       null: false
      t.string      :street_address,  null: false
      t.string      :building
      t.string      :phone_number,    null: false
      t.timestamps
    end
  end
end
