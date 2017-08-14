class AddPriceToCurriculums < ActiveRecord::Migration
  def change
    add_column :curriculums, :price, :integer
  end
end
