class AddImageToCurriculums < ActiveRecord::Migration
  def change
    add_column :curriculums, :image, :string
  end
end
