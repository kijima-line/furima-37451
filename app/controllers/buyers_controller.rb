class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :set_url, only: [:index,:create]


  def index
    @address = Address.new
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




  private

  def buyer_params
    params.require(:address).permit(:post_code, :prefecture_id, :city, :address_number, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.sale,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_url
   if @item.user_id == current_user.id || @item.buyer != nil
   redirect_to root_path
  end
end
end
