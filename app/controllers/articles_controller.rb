class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.load_articles(page: params[:page])
  end

  def show
  end

  def new
    @article = Article.new
  end

  # Show the article url previsualization when its been created
  def upload_url
    respond_to do |format|
      format.js
    end
  end

  def edit
  end

  def create
    @article = Article.create(article_params)
    # @project = Project.searchById(params[:project_id])
    # @subscribers = Subscriber.searchByWhere(:project_id => params[:project_id])

    # @subscribers.each do |subscriber|
      # NewArticleMailer.new_article_email(subscriber, @article).deliver_now
    # end

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'El artículo fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'El artículo fue actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to home_url, notice: 'El artículo fue liminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    def set_article
      @article = Article.searchById(params[:id])
    end

    def article_params
      params.require(:article).permit(:name, :pdf, :url, :html, :key_words, :description, :language, :bibliography, :uploader_type).merge(user_id: current_user.id, project_id: params[:project_id])
    end
end
