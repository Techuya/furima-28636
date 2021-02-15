require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '商品の購入' do
    context '商品の購入がうまくいくとき' do
      it '全ての項目が正しく入力されたら商品が購入ができる' do
        expect(@user_order).to be_valid
      end
      
      it '建物名が空でも商品が購入ができる' do
        @user_order.building = ''
        expect(@user_order).to be_valid
      end
    end

    context '商品の購入がうまくいかないとき' do
      it 'tokenが空だと購入ができない' do
        @user_order.token = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
      
      it '郵便番号が空だと購入ができない' do
        @user_order.postal_code = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end
      
      it '郵便番号にハイフンが含まれないと購入ができない' do
        @user_order.postal_code = '0000000'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid")
      end
      
      it '都道府県名がないと購入ができない' do
        @user_order.prefecture_id = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      
      it '都道府県名が[---]だと購入ができない' do
        @user_order.prefecture_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      
      it '市区町村名がないと購入ができない' do
        @user_order.city = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end
      
      it '番地がないと購入ができない' do
        @user_order.house_number = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("House number can't be blank")
      end
      
      it '電話番号がないと購入ができない' do
        @user_order.phone_number = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end
      
      it '電話番号にハイフンが含まれていると購入ができない' do
        @user_order.phone_number = '080-0000-0000'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is invalid")
      end
      
      it '電話番号に英字が含まれると購入できない' do
        @user_order.phone_number = '0800000abcd'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is invalid")
      end
      
      it '電話番号が11桁以上だと購入できない' do
        @user_order.phone_number = '080000000000'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is invalid")
      end
      
      it '電話番号が全角数字だと購入できない' do
        @user_order.phone_number = '０8０００００００００'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is invalid")
      end
      
      it 'item_idが空だと購入できない' do
        @user_order.item_id = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Item can't be blank")
      end
      
      it 'user_idが空だと購入できない' do
        @user_order.user_id = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
