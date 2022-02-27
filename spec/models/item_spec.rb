require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '出品機能' do
    context '保存できる場合' do
      it '全ての項目が入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    it 'titleが空だと登録できない' do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it 'descriptionが空だと登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'category_idが1だと登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'status_idが1だと登録できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it 'buy_cost_idが1だと登録できない' do
      @item.buy_cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Buy cost can't be blank")
    end
    it 'prefecture_idが1だと登録できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'buy_day_idが1だと登録できない' do
      @item.buy_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Buy day can't be blank")
    end
    it 'saleが空だと登録できない' do
      @item.sale = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Sale can't be blank")
    end
    it '金額が300未満だと登録できない' do
      @item.sale = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Sale must be greater than or equal to 300')
    end
    it '金額が10,000,000以上だと登録できない' do
      @item.sale = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Sale must be less than or equal to 9999999')
    end
    it '金額が半角以外だと登録できない' do
      @item.sale = '1２１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include('Sale is not a number')
    end

    it 'userが紐付いていなければ登録できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
