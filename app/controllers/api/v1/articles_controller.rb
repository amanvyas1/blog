class Api::V1::ArticlesController < ActionController::API
    before_action :set_article, only: [:show, :update, :destroy]
  
    # GET /api/v1/articles
    def index
      @articles = Article.all
      render json: @articles
    end
  
    # GET /api/v1/articles/:id
    def show
      render json: @article
    end
  
    # POST /api/v1/articles
    def create
      @article = Article.new(article_params)
  
      if @article.save
        render json: @article, status: :created
      else
        render json: @article.errors, status: :unprocessable_entity
      end
    end
  
    # PUT/PATCH /api/v1/articles/:id
    def update
      if @article.update(article_params)
        render json: @article
      else
        render json: @article.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/v1/articles/:id
    def destroy
      @article.destroy
      head :no_content
    end
  
    private
  
    def set_article
      @article = Article.find(params[:id])
    end
  
    def article_params
      params.require(:article).permit(:title, :content, :status)
    end
  end