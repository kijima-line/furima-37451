require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "出品機能" do
    # it '全ての項目が入力されていれば登録できる' do
    #   expect(@item).to be_valid
    # end
    it "titleが空だと登録できない" do

      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it "descriptionが空だと登録できない" do
      #
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it "category_idが空だと登録できない" do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "status_idが空だと登録できない" do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it "buy_cost_idが空だと登録できない" do
      @item.buy_cost_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Buy cost can't be blank")
    end
    it "prefecture_idが空だと登録できない" do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "buy_day_idが空だと登録できない" do
      @item.buy_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Buy day can't be blank")
    end
    it "saleが空だと登録できない" do
      @item.sale = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Sale can't be blank")
    end
    
  end
end