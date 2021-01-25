require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の登録' do
    context "商品が登録できる場合" do
      it "画像や商品名等必須項目が存在していれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context "商品が登録できない場合" do
      it "出品画像が空だと登録ができない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end     

      it "商品名が空だと登録ができない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "商品説明が空だと登録ができない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "カテゴリーが[---]だと登録ができない" do
        @item.category_id = [1]
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "商品の状態が[---]だと登録ができない" do
        @item.product_condition_id = [1]
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end

      it "配送料の負担が[---]だと登録ができない" do
        @item.postage_payer_id = [1]
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer can't be blank")
      end

      it "発送元の地域が[---]だと登録ができない" do
        @item.prefecture_id = [1]
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "発送までの日数が[---]だと登録ができない" do
        @item.arrival_day_id = [1]
        @item.valid?
        expect(@item.errors.full_messages).to include("Arrival day can't be blank")
      end

      it "販売価格が空だと登録ができない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "販売価格が¥300未満だと登録ができない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end

      it "販売価格が¥9,999,999より高いと登録ができない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end

      it "ユーザーが紐付いていないと商品の登録ができない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
