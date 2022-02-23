class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_action, only: [:edit, :destroy]

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

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
<<<<<<< Updated upstream
    redirect_to root_path(@item)
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


=======
      redirect_to root_path(@item)
      else
      render :index
      end
  end

>>>>>>> Stashed changes
  private
  def set_action
    redirect_to root_path unless current_user.id == @item.user_id 
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :status_id, :buy_cost_id, :prefecture_id, :buy_day_id,
                                 :sale, :image).merge(user_id: current_user.id)
  end
end
