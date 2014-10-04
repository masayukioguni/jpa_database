class CreateWeightCategories < ActiveRecord::Migration
  def change
    create_table :weight_categories do |t|
      t.string :name
      t.float :min
      t.float :max

      t.timestamps
    end
  end
end
