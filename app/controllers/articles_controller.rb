class ArticlesController < ApplicationController
  def index
    @articles = Article.order('created_at DESC').all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:category_id, :prefecture_id, :status_id, :buy_cost_id, :buy_day_id)
  end
end
