class HomeController < ApplicationController
  # load_and_authorize_resource
  before_action :set_category,:sort, only: [:show]
  def index
    @curriculums=Curriculum.all
    @title = "전체 커리큘럼 보기"
  end
  def show
    # @curriculums=@category.curriculums
    @title = @category.name+" 커리큘럼 보기"
    # render 'index'
    if params[:sort]
      respond_to do |format|
        format.js
      end
    end
  end
  def create
    @category=Category.new(category_params)
    if @category.save
      redirect_to root_path
    else
      redirect_to root_path,alert: "카테고리 생성을 실패했습니다."
    end
    authorize! :create, @category
  end
  def new
    @category= Category.new
    authorize! :create, @category
  end
  private
  def set_category
    @category=Category.find(params[:id])
  end
  def category_params
    params.require(:category).permit(:name,:description)
  end
  def sort
    set_category
    if params[:sort]
      case params[:sort].to_i
        when 1 then @curriculums=@category.curriculums # 전체
        when 2 then @curriculums=@category.curriculums # 무료
        when 3 then @curriculums=@category.curriculums # 유료
        when 4 then @curriculums=@category.curriculums.where(user_id: current_user) # 나의 강의
        when 5 then @curriculums=@category.curriculums # 수강 강의
      end
    else
      @curriculums=@category.curriculums
    end
  end
end
