class BuyersController < ApplicationController
  def index
    @item = Item.all
  end
  def create
  end
end
