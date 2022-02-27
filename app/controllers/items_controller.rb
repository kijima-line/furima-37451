class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_url, only: [:edit, :update, :destroy]

  def index
    @item = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private


  def set_item
    @item = Item.find(params[:id])
  end

  def set_url

    if 
     @item.user_id != current_user.id && @item.buyer.nil?
     redirect_to root_path 
    end
  end

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :status_id, :buy_cost_id, :prefecture_id, :buy_day_id,
                                 :sale, :image).merge(user_id: current_user.id)
  end
end
