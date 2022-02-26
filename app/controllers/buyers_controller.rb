class BuyersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:index, :create]
  before_action :set_address, only: [:index, :new]


  def index

  end

  def new
    @item = Item.new

  end

  def create
    @address = Address.new(buyer_params)
    if @address.valid?
    pay_item
      @address.save
      redirect_to root_path
    else
      render :index
    end
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
  def set_address
    @address = Address.new
  end


  private

  def buyer_params
    params.require(:address).permit(:post_code, :prefecture_id, :city, :address_number, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[ :item_id] ,token: params[:token]
    )
  end
  def pay_item
    Payjp.api_key = "sk_test_bd19d2510168662a150e5b68"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
     amount: @item.sale,
     card: buyer_params[:token],    # カードトークン
     currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
