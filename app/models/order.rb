class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :purchase_history
end