require 'rails_helper'

RSpec.describe Address, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @address = FactoryBot.build(:address, user_id: user.id)
    end

    context '内容に問題ない場合' do
      # it 'すべての値が正しく入力されていれば保存できること' do
      #   expect(@address).to be_valid
      # end
      it 'cityは空では保存できない' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it 'phone_numberは空では保存できない' do
        @address.phone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'building_nameは空でも保存できる' do
        binding.pry
        @address.building_name = ''
        expect(@address).to be_valid
      end
    end

    context '内容に問題がある場合' do
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
        # binding.pry
        @address.prefecture_id = 0
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @address.user_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
