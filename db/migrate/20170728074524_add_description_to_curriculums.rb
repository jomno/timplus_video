class AddDescriptionToCurriculums < ActiveRecord::Migration
  def change
    add_column :curriculums, :description, :text
  end
end
