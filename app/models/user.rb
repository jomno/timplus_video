class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
        # , :validatable
  after_create :assign_default_role
  
  scope :seller, -> {with_role :seller}
  scope :admin, -> {with_role :admin}
  scope :default, -> {with_role :default}
  def assign_default_role
    self.add_role(:default) if self.roles.blank?
  end
  def email_required?
    false
  end
end
