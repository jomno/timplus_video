class CurriculumsController < ApplicationController
  load_and_authorize_resource
  before_action :set_curriculum, only: [:show, :edit, :update, :destroy]
  before_action :set_category

  # GET /curriculums
  # GET /curriculums.json
  # def index
  #   @curriculums = @category.curriculums
  # end

  # GET /curriculums/1
  # GET /curriculums/1.json
  def show
    @articles = @curriculum.articles
  end

  # GET /curriculums/new
  def new
    @curriculum = Curriculum.new
    @curriculum_url=@curriculum
  end

  # GET /curriculums/1/edit
  def edit
    @curriculum_url = url_for(controller: :curriculums, action: :update, home_id: @category.id, id: @curriculum.id)
  end

  # POST /curriculums
  # POST /curriculums.json
  def create
    @curriculum = Curriculum.new(curriculum_params)
    @curriculum.category = @category
    @curriculum.user=current_user
    uploader=ImageUploader.new
    # puts params.require(:curriculum).permit(:image)[:image]
    uploader.store!(params.require(:curriculum).permit(:image)[:image])
    @curriculum.image=uploader.url
    respond_to do |format|
      if @curriculum.save
        format.html { redirect_to home_path(@category.id), notice: 'Curriculum was successfully created.' }
        format.json { render :show, status: :created, location: @curriculum }
      else
        format.html { render :new }
        format.json { render json: @curriculum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curriculums/1
  # PATCH/PUT /curriculums/1.json
  def update
    uploader=ImageUploader.new
    uploader.store!(params.require(:curriculum).permit(:image)[:image])
    @curriculum.image=uploader.url
    respond_to do |format|
      if @curriculum.update(curriculum_params)
        format.html { redirect_to curriculum_path(@category.id,@curriculum.id), notice: 'Curriculum was successfully updated.' }
        format.json { render :show, status: :ok, location: @curriculum }
      else
        format.html { render :edit }
        format.json { render json: @curriculum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curriculums/1
  # DELETE /curriculums/1.json
  def destroy
    @curriculum.destroy
    respond_to do |format|
      format.html { redirect_to home_path(@category.id), notice: 'Curriculum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_category
      @category=Category.find(params[:home_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_curriculum
      @curriculum = Curriculum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curriculum_params
      params.require(:curriculum).permit(:title, :description)
    end
    
end
