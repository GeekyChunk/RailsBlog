class ArticlesController < ApplicationController
  before_action :authorize

  def index
    render json: Article.all
  end

  def create
    article = @current.articles.new(article_params)

    if article.save
      head 201
    else
      render json: article.errors
    end
  end

  def show
    @article = Article.find(params[:id])
    render json: @article
  end

  def update
    @article = @current.articles.find(params[:id])

    if @article.update(article_params.to_h)
      render json: @article
    else
      render json: @article.errors
    end
  end

  def destroy
    @article = @current.articles.find(params[:id])
    @article.destroy!
    head 204
  end

  private

  def article_params
    params.permit(:title, :caption)
  end
end
