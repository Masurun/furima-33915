require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item=FactoryBot.build(:item)
  end
  describe "商品出品機能" do
    context "商品出品機能が正常に挙動しない時" do
      it "imageが空では保存できない" do
       @item.image=nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空では保存できない" do
        @item.name=""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "nameが40文字以上では保存できない" do
        @item.name="a" * 41
        
         @item.valid?
         expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
       end
      it "descriptionが1000文字以上では保存できない" do
        @item.description="a" * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
      end
      it "descriptionが空では保存できない" do
        @item.description=""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "caregory_idが空では保存できない" do
        @item.category_id=""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number", "Category can't be blank") 
      end
      it "category_idが1以外でないと登録できないこと" do
        @item.category_id="1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1") 
      end
      it "status_idが空では保存できない" do
        @item.status_id=""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number", "Status can't be blank")
      end
      it "status_idが1以外でないと登録できないこと" do
        @item.status_id="1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "deliver_burden_idが空では保存できない" do
        @item.deliver_burden_id=""
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliver burden is not a number", "Deliver burden can't be blank") 
      end
      it "deliver_burden_idが1以外でないと登録できないこと" do
        @item.deliver_burden_id="1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliver burden must be other than 1") 
      end
      it "pref_idが空では保存できない" do
        @item.pref_id=""
        @item.valid?
        expect(@item.errors.full_messages).to include("Pref is not a number", "Pref can't be blank")
      end
      it "pref_idが1以外でないと登録できないこと" do
        @item.pref_id="1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Pref must be other than 1")
      end
      it "deliver_date_idが空では保存できない" do
        @item.deliver_date_id=""
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliver date is not a number", "Deliver date can't be blank")
      end
      it "delivery_date_idが1以外でないと登録できないこと" do
        @item.deliver_date_id="1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliver date must be other than 1")
      end
      it "sell_priceが空では保存できない" do
        @item.sell_price=""
        @item.valid?
        expect(@item.errors.full_messages).to include("Sell price can't be blank", "Sell price is not a number")
      end
      it "sell_priceが300円以下では保存できない" do
        @item.sell_price="100"
        @item.valid?
        expect(@item.errors.full_messages).to include("Sell price must be greater than or equal to 300")
      end
      it "sell_priceが9999999円以下では保存できない" do
        @item.sell_price="99999999"
        @item.valid?
        expect(@item.errors.full_messages).to include("Sell price must be less than or equal to 9999999")
      end
      it "sell_priceが数字以外では保存できない" do
        @item.sell_price="test"
        @item.valid?
        expect(@item.errors.full_messages).to include("Sell price is not a number")
      end
      it "sell_priceが整数以外では保存できない" do
        @item.sell_price="3.141592"
        @item.valid?
        expect(@item.errors.full_messages).to include("Sell price must be an integer")
      end
      it "sell_priceが全角文字では登録できないこと" do
        @item.sell_price="テスト"
        @item.valid?
        expect(@item.errors.full_messages).to include("Sell price is not a number")
      end
      it "sell_priceが半角英数混合では登録できないこと" do
        @item.sell_price="123abc"
        @item.valid?
        expect(@item.errors.full_messages).to include("Sell price is not a number")
      end
      it "sell_priceが半角英語だけでは登録できないこと" do
        @item.sell_price="test"
        @item.valid?
        expect(@item.errors.full_messages).to include("Sell price is not a number")
      end
    end
    context "商品出品機能が正常に挙動する時" do
      it "すべての情報が登録できる時" do
        expect(@item).to be_valid
    end
    end
  end
end
