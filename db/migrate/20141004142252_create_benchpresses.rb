class CreateBenchpresses < ActiveRecord::Migration
  def change
    create_table :benchpresses do |t|
      t.references :lifter
      t.references :weight_category
      t.references :class_category
      t.references :championship
      t.float :weight
      t.float :first
      t.float :second
      t.float :third
      t.boolean :use_gear
      t.boolean :is_disqualified
      t.timestamps
    end
  end
end
