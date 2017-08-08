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
  private
  def set_category
    @category=Category.find(params[:id])
  end
end
