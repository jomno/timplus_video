class ArticlesController < ApplicationController
  load_and_authorize_resource
  before_action :set_article, only: [ :edit, :update, :destroy]
  before_action :set_category,:set_curriculum
  

  # GET /articles
  # GET /articles.json
  # def index
  #   @articles = @curri.all
  # end

  # GET /articles/1
  # GET /articles/1.json
  # def show
  # end

  # GET /articles/new
  def new
    @article = Article.new
    @article_url = @article
  end

  # GET /articles/1/edit
  def edit
    @article_url = url_for(controller: :aritcles, action: :update,home_id: @category.id, curriculum_id: @curriculum.id, id: @article.id)
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.curriculum = @curriculum
    uploader=VideoUploader.new
    uploader.store!(params.require(:article).permit(:videolink2)[:videolink2])
    @article.videolink2=uploader.url
    # puts @article.videolink2
    respond_to do |format|
      if @article.save
        format.html { redirect_to curriculum_path(@category.id,@curriculum.id), notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { redirect_to curriculum_path(@category.id,@curriculum.id), notice: @article.errors.full_messages }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    uploader=VideoUploader.new
    uploader.store!(params.require(:article).permit(:videolink2)[:videolink2])
    @article.videolink2=uploader.url
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_category
      @category=Category.find(params[:home_id])
    end
    def set_curriculum
      @curriculum=Curriculum.find(params[:curriculums_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title,:videolink,:description)
    end
end
