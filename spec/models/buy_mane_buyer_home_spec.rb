require 'rails_helper'

RSpec.describe BuyManeBuyerHome , type: :model do
  before do
    @user=FactoryBot.create(:user)
    @item=FactoryBot.create(:item)
    sleep 0.5
    @buy_mane_buyer_home=FactoryBot.build(:buy_mane_buyer_home, user_id: :user,item_id: :item)
  end
  
  describe "商品購入機能" do
    context "商品購入機能が正常に挙動しない時" do
      it "post_numが空では保存できない" do
        @buy_mane_buyer_home.post_num=""
        @buy_mane_buyer_home.valid?
       expect(@buy_mane_buyer_home.errors.full_messages).to include("Post num can't be blank", "Post num is invalid")
      end
      it "post_numはハイフンがないと保存できない" do
        @buy_mane_buyer_home.post_num="1234567"
        @buy_mane_buyer_home.valid?
       expect(@buy_mane_buyer_home.errors.full_messages).to include("Post num is invalid")
      end
      it "post_numは1234-567では保存できない" do
        @buy_mane_buyer_home.post_num="1234-567"
        @buy_mane_buyer_home.valid?
       expect(@buy_mane_buyer_home.errors.full_messages).to include("Post num is invalid")
      end
      it "pref_idが空では保存できない" do
        @buy_mane_buyer_home.pref_id=""
        @buy_mane_buyer_home.valid?
        expect(@buy_mane_buyer_home.errors.full_messages).to include("Pref is not a number")
      end
      it "pref_idが1以外でないと登録できないこと" do
        @buy_mane_buyer_home.pref_id=1
        @buy_mane_buyer_home.valid?
        expect(@buy_mane_buyer_home.errors.full_messages).to include("Pref must be other than 1")
      end
      it "post_numは数字がハイフンと数字以外が入っていると保存できない" do
        @buy_mane_buyer_home.post_num="12a-4567"
        @buy_mane_buyer_home.valid?
       expect(@buy_mane_buyer_home.errors.full_messages).to include("Post num is invalid")
      end
      it "cityが空では保存できない" do
        @buy_mane_buyer_home.city=""
        @buy_mane_buyer_home.valid?
       expect(@buy_mane_buyer_home.errors.full_messages).to include("City can't be blank")
      end
      it "streetが空では保存できない" do
        @buy_mane_buyer_home.street=""
        @buy_mane_buyer_home.valid?
       expect(@buy_mane_buyer_home.errors.full_messages).to include("Street can't be blank")
      end
      it "phone_numが空では保存できない" do
        @buy_mane_buyer_home.phone_num=""
        @buy_mane_buyer_home.valid?
       expect(@buy_mane_buyer_home.errors.full_messages).to include("Phone num can't be blank", "Phone num is not a number")
      end
      it "phone_numに数字以外が入っている状態では保存できない" do
        @buy_mane_buyer_home.phone_num="test"
        @buy_mane_buyer_home.valid?
       expect(@buy_mane_buyer_home.errors.full_messages).to include("Phone num is not a number")
      end
      it "phone_numが11桁以上では保存できない" do
        @buy_mane_buyer_home.phone_num="123456789111"
        @buy_mane_buyer_home.valid?
       expect(@buy_mane_buyer_home.errors.full_messages).to include("Phone num is too long (maximum is 11 characters)")
      end
      it "tokenが空では保存できない" do
        @buy_mane_buyer_home.token=nil
        @buy_mane_buyer_home.valid?
       expect(@buy_mane_buyer_home.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが空では保存できない" do
        @buy_mane_buyer_home.user_id=nil
        @buy_mane_buyer_home.valid?
       expect(@buy_mane_buyer_home.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では保存できない" do
        @buy_mane_buyer_home.item_id=nil
        @buy_mane_buyer_home.valid?
       expect(@buy_mane_buyer_home.errors.full_messages).to include("Item can't be blank")
      end
    end
      context "商品購入機能が正常に挙動する時" do
        it "すべての情報が登録できる時" do
        expect(@buy_mane_buyer_home).to be_valid
      end 
        it "buildingの情報が空の状態でも購入できる" do
          @buy_mane_buyer_home.building=""
          expect(@buy_mane_buyer_home).to be_valid
        end
    end

  end
end
