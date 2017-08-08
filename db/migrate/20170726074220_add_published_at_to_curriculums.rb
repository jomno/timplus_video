class AddPublishedAtToCurriculums < ActiveRecord::Migration
  def change
    add_column :curriculums, :published_at, :datetime
  end
end
