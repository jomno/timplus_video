class RemoveDesctiptionFromCurriculums < ActiveRecord::Migration
  def change
    remove_column :curriculums, :desctiption, :text
  end
end
