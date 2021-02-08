class BuyMane < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :buyer_home
end
