class ItemsController < ApplicationController
  before_action :authenticate_user!,except:[:index,:show]
  def index
  @items=Item.all.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

    def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :deliver_burden_id, :pref_id, :deliver_date_id,
                                 :sell_price,:image).merge(user_id: current_user.id)
    end
end
