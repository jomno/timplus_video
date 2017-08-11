ActiveAdmin.register User do
scope :all
scope :default
scope :seller
scope :admin
 #default로 변환
 action_item :default, only: :show do
    link_to "default", default_admin_user_path(user), method: :put unless user.has_role? :default
 end
 member_action :default, method: :put do
    user = User.find(params[:id])
    roles=user.roles.map{|v| v.name.to_sym}
    roles.each{|r| user.remove_role r}
    user.add_role :default
    redirect_to admin_user_path(user)
 end
 #seller로 변환
 action_item :seller, only: :show do
    link_to "seller", seller_admin_user_path(user), method: :put unless user.has_role? :seller
 end
 member_action :seller, method: :put do
    user = User.find(params[:id])
    roles=user.roles.map{|v| v.name.to_sym}
    roles.each{|r| user.remove_role r}
    user.add_role :seller
    redirect_to admin_user_path(user)
 end
 #admin으로 변환
 action_item :admin, only: :show do
    link_to "admin", admin_admin_user_path(user), method: :put unless user.has_role? :admin
 end
 member_action :admin, method: :put do
    user = User.find(params[:id])
    roles=user.roles.map{|v| v.name.to_sym}
    roles.each{|r| user.remove_role r}
    user.add_role :admin
    redirect_to admin_user_path(user)
 end
end
