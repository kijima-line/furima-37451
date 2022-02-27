require 'rails_helper'

RSpec.describe Region, type: :model do
  describe '金額情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @region = FactoryBot.build(:region, user_id: user.id)
    end
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@region).to be_valid
    end
    it 'cityは空でも保存できること' do
      @region.city = ''
      expect(@region).to be_valid
    end
    it 'house_numberは空でも保存できること' do
      @region.house_number = ''
      expect(@region).to be_valid
    end
    it 'building_nameは空でも保存できること' do
      @region.building_name = ''
      expect(@region).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'postal_codeが空だと保存できないこと' do
      @region.postal_code = ''
      @region.valid?
      expect(@region.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @region.postal_code = '1234567'
      @region.valid?
      expect(@region.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'prefectureを選択していないと保存できないこと' do
      @region.prefecture = 0
      @region.valid?
      expect(@region.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'priceが空だと保存できないこと' do
      @region.price = nil
      @region.valid?
      expect(@region.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが全角数字だと保存できないこと' do
      @region.price = '２０００'
      @region.valid?
      expect(@region.errors.full_messages).to include('Price is invalid')
    end
    it 'priceが1円未満では保存できないこと' do
      @region.price = 0
      @region.valid?
      expect(@region.errors.full_messages).to include('Price is invalid')
    end
    it 'priceが1,000,000円を超過すると保存できないこと' do
      @region.price = 1_000_001
      @region.valid?
      expect(@region.errors.full_messages).to include('Price is invalid')
    end
    it 'userが紐付いていないと保存できないこと' do
      @region.user_id = nil
      @region.valid?
      expect(@region.errors.full_messages).to include("User can't be blank")
    end
  end
end
