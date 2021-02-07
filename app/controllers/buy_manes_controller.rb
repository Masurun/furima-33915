class BuyManesController < ApplicationController
  before_action :item_params,only:[:index,:create]
  before_action :move_to_index,only:[:index,:create]
def index
  if @item.user_id==current_user.id &&  @item.buy_mane != nil
    redirect_to root_path
  end
  @buy_mane_buyer_home=BuyManeBuyerHome.new
end

def create
  @buy_mane_buyer_home=BuyManeBuyerHome.new(buy_mane_params)

  if @buy_mane_buyer_home.valid?
    pay_item
    @buy_mane_buyer_home.save
    redirect_to root_path
  else
    render :index
  end
  
end
private
def buy_mane_params
  params.require(:buy_mane_buyer_home).permit(:post_num,:pref_id,:city,:street,:phone_num,:building).merge(item_id: params[:item_id],user_id: current_user.id,token: params[:token])
end
def item_params
  @item=Item.find(params[:item_id])
end
def pay_item
  Payjp.api_key= ENV["PAYJP_SELECT_KEY"]
  Payjp::Charge.create(
    amount: item_params[:sell_price],
    card: buy_mane_params[:token],
    currency: 'jpy'
  )
end
def move_to_index
  unless user_signed_in? && @item.buy_mane == nil
    redirect_to root_path
  end
  

end
end
