class AddVideolink2ToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :videolink2, :text
    add_column :articles, :ytb, :boolean
  end
end
