class CreatePowerliftings < ActiveRecord::Migration
  def change
    create_table :powerliftings do |t|
      t.references :lifter
      t.references :weight_category
      t.references :class_category
      t.references :championship
      t.float :weight
      t.float :squat_first
      t.float :squat_second
      t.float :squat_third
      t.float :benchpress_first
      t.float :benchpress_second
      t.float :benchpress_third
      t.float :deadlift_first
      t.float :deadlift_second
      t.float :deadlift_third
      t.boolean :use_gear
      t.boolean :is_disqualified
      t.timestamps
    end
  end
end
