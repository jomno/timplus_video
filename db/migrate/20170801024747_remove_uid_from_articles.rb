class RemoveUidFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :uid, :integer
    add_column :articles, :uid, :string
  end
end
