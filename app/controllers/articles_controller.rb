class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: %i[create edit update destroy ]
  before_action :is_authorized_user, only: %i[update destroy ]
  before_action :is_public?, only: %i[show]
  # GET /articles
  def index
    @articles = Article.all

    render json: @articles
  end

  # GET /articles/1
  def show
    render json: @article
  end

  # POST /articles
  def create

    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.permit(:title, :content, :user_id)
    end
    
    def is_public?
      if  @article.is_private == false ||  user_signed_in? && is_authorized_user
        return true 
      else
        unauthorized
      end 
    end
    
end
