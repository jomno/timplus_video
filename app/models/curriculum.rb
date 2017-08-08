class Curriculum < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :articles
  
  scope :published, -> {where.not(published_at: nil)}
  scope :unpublished, -> {where(published_at: nil)}

end
