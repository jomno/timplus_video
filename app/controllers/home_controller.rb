class HomeController < ApplicationController
  before_action :set_category, only: [:show]
  def index
    @curriculums=Curriculum.all
    @title = "전체 커리큘럼 보기"
  end
  def show
    @curriculums=@category.curriculums
    @title = @category.name+" 커리큘럼 보기"
    render 'index'
  end
  def create
    @category=Category.new(category_params)
    if @category.save
      redirect_to root_path
    else
      redirect_to root_path,alert: "카테고리 생성을 실패했습니다."
    end
  end
  def new
    @category= Category.new
  end
  private
  def set_category
    @category=Category.find(params[:id])
  end
  def category_params
    params.require(:category).permit(:name,:description)
  end
end
