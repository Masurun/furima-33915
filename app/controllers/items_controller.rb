class ItemsController < ApplicationController
  before_action :authenticate_user!,except:[:index,:show]
  before_action :set_item,only:[:show,:destroy,:edit,:update]
  
  def index
  @items=Item.includes(:user).order("created_at DESC")
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
  
  def show
  end

  def destroy
    if @item.user_id==current_user.id
     if @item.destroy
    redirect_to root_path
     else
      render :show
    end
   end
  end

  def edit
    if @item.user_id!=current_user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end
  private

    def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :deliver_burden_id, :pref_id, :deliver_date_id,
                                 :sell_price,:image).merge(user_id: current_user.id)
    end
    def set_item
      @item=Item.find(params[:id])
    end
end
