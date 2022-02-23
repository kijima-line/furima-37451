class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :edit, :show]

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
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :status_id, :buy_cost_id, :prefecture_id, :buy_day_id,
                                 :sale, :image).merge(user_id: current_user.id)
  end
end
