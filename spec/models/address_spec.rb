require 'rails_helper'

RSpec.describe Address, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)

      @address = FactoryBot.build(:address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@address).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @address.building_name = ' '
        expect(@address).to be_valid
      end
      it 'tokenがあれば保存ができること' do
        expect(@address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が半角ハイフンを含む形でなければ購入できない' do
        @address.post_code = '8888888'
        @address.valid?
        expect(@address.errors.full_messages).to include("Post code is invalid")
      end
      it 'cityは空では保存できない' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it 'address_numberは空では保存できない' do
        @address.address_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Address number can't be blank")
      end

      it 'phone_numberは空では保存できない' do
        @address.phone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは半角記号では保存できない' do
        @address.phone_number = '090-9876-9999'
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは9行以下では保存できない' do
        @address.phone_number = '090987699'
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは12行以上では保存できない' do
        @address.phone_number = '090987699999'
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'post_codeが空だと保存できないこと' do
        @address.post_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @address.post_code = '1234567'
        @address.valid?

        expect(@address.errors.full_messages).to include('Post code is invalid')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @address.prefecture_id = ''
        @address.valid?
        expect(@address.errors.full_messages).to include('Prefecture cant be blank')
      end
      it 'prefecture_idが0では保存できないこと' do
        @address.prefecture_id = '0'
        @address.valid?
        expect(@address.errors.full_messages).to include('Prefecture cant be blank')
      end
      it 'item_id がないと保存できないこと' do
        @address.item_id = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @address.token = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @address.user_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
