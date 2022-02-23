class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :edit, :show,]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]

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

     
    redirect_to root_path unless current_user.id == @item.user_id

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
  def item_params
    params.require(:item).permit(:title, :description, :category_id, :status_id, :buy_cost_id, :prefecture_id, :buy_day_id,
                                 :sale, :image).merge(user_id: current_user.id)
  end
  def move_to_index
    unless user_signed_in?
      redirect_to action: :new
    end
  end

end
