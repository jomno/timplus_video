class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_categories
  
  rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden, content_type: 'text/html' }
        format.html { redirect_to main_app.root_url, notice: "권한이 없습니다." }
        format.js   { head :forbidden, content_type: 'text/html' }
      end
  end
  # 밑에 거는 active_admin 전용 거부 코드
  def access_denied(exception)
      redirect_to users_path, notice: exception.message
  end
  private
  def set_categories
    @categories=Category.all
  end
end
