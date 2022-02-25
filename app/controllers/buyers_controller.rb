class BuyersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @item = Item.find(params[:item_id])
    @address = Address.new
  end

  def new
    @item = Item.new
    @address = Address.new
  end

  def create
     @address = Address.new(buyer_params)
    if @address.valid?
      @address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def buyer_params
     params.require(:address).permit( :post_code, :prefecture_id, :city, :address_number, :building_name, :phone_number ).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  # def address_params
  #   params.permit( :post_code, 
  #     :prefecture_id, :city, :address_number, :building_name, :phone_number)
  #     .merge(user_id: current_user.id,item_id:params[:item_id])
  # end
end
