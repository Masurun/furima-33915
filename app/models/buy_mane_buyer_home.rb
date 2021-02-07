class BuyManeBuyerHome
  include ActiveModel::Model
  attr_accessor :post_num,:pref_id,:city,:street,:phone_num,:building,:user_id,:item_id,:token
  def save

    buy_mane=BuyMane.create(user_id: user_id,item_id: item_id)
    BuyerHome.create(post_num: post_num,pref_id: pref_id,city: city,street: street,phone_num: phone_num,building: building,buy_mane_id: buy_mane.id)
  end
  with_options presence: true do
    validates :post_num
    validates :city 
    validates :street
    validates :phone_num
    validates :token
  end
  validates :pref_id, numericality: { other_than: 1 } 

  validates :phone_num,numericality:{only_integer: true}
  validates :phone_num,length:{maximum: 11}

  validates :post_num,format:{with:/\d{3}[-]\d{4}\z/}
end
