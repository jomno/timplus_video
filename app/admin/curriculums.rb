ActiveAdmin.register Curriculum do
scope :all
scope :published
scope :unpublished
 
 batch_action :publish do |ids|
    batch_action_collection.find(ids).each do |curriculum|
      curriculum.update(published_at: Time.zone.now)
    end
    redirect_to admin_curriculums_path, alert: "모두 publish 됬습니다."
 end
 batch_action :unpublish do |ids|
    batch_action_collection.find(ids).each do |curriculum|
      curriculum.update(published_at: nil)
    end
    redirect_to admin_curriculums_path, alert: "모두 unpublish 됬습니다."
 end
 action_item :unpublish, only: :show do
    link_to "unpublish", unpublish_admin_curriculum_path(curriculum), method: :put if curriculum.published_at?
 end
    
 member_action :unpublish, method: :put do
    curriculum = Curriculum.find(params[:id])
    curriculum.update(published_at: nil)
    redirect_to admin_curriculum_path(curriculum)
 end
 action_item :publish, only: :show do
    link_to "publish", publish_admin_curriculum_path(curriculum), method: :put unless curriculum.published_at?
 end
    
 member_action :publish, method: :put do
    curriculum = Curriculum.find(params[:id])
    curriculum.update(published_at: Time.zone.now)
    redirect_to admin_curriculum_path(curriculum)
 end

end
