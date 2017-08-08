class AddCurriculumToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :curriculum, index: true, foreign_key: true
  end
end
