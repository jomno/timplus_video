require 'net/http'
require 'json'
class HomeController < ApplicationController
  # load_and_authorize_resource
  before_action :set_category,:sort, only: [:show]
  def index
    @curriculums=Curriculum.where.not(published_at: nil)
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
  def login
    id=params[:id]
    password=params[:password]
    tbluser = TblUser.find_by(USER_ID: id, USER_PASS2: password)
    userData={email: id, password: password, password_confirmation: password}
    if tbluser.nil?
      redirect_to root_path,alert: "계정이 없습니다. 팀플러스에서 먼저 가입해주세요."
    else
      user = User.find_or_create_by(email: id)
      sign_in(user, scope: :user)
      redirect_to root_path,alert: "성공적으로 로그인되었습니다."
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
        when 1 then @curriculums=@category.curriculums.where.not(published_at: nil) # 전체
        when 2 then @curriculums=@category.curriculums.where.not(published_at: nil) # 무료
        when 3 then @curriculums=@category.curriculums.where.not(published_at: nil) # 유료
        when 4 then @curriculums=@category.curriculums.where(user_id: current_user) # 나의 강의
        when 5 then @curriculums=@category.curriculums.where.not(published_at: nil) # 수강 강의
      end
    else
      @curriculums=@category.curriculums.where.not(published_at: nil)
    end
  end
end
