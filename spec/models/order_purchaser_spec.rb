require 'rails_helper'

RSpec.describe OrderPurchaser, type: :model do
  describe '購入' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @order_purchaser = FactoryBot.build(:order_purchaser, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end
  
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_purchaser).to be_valid
      end

      it 'buildingは空でも保存できる' do
        @order_purchaser.building = ''
        expect(@order_purchaser).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空では保存できない' do
        @order_purchaser.post_code = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_purchaser.post_code = '1234567'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Post code is invalid")
      end

      it 'prefecture_idを選択していないと保存できない' do
        @order_purchaser.prefecture_id = '0'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では保存できない' do
        @order_purchaser.city = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では保存できない' do
        @order_purchaser.address = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では保存できない' do
        @order_purchaser.phone_number = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberは半角数字出なければ保存できない' do
        @order_purchaser.phone_number = '０９０１２３４５６７８'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberは9桁以下では保存できない' do
        @order_purchaser.phone_number = '09012345'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberは12桁以上では保存できない' do
        @order_purchaser.phone_number = '0901234567890'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Phone number is invalid")
      end

      it 'itemが紐付いていないと保存できない' do
        @order_purchaser.item_id = nil
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Item can't be blank")
      end

      it 'userが紐付いていないと保存できない' do
        @order_purchaser.user_id = nil
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
