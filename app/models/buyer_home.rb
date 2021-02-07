class BuyerHome < ApplicationRecord
  belongs_to :buy_mane
  with_options presence: true do
    validates :post_num
    validates :pref_id
    validates :city 
    validates :street
    validates :phone_num
  end
end
