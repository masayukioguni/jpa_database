class CreateLifters < ActiveRecord::Migration
  def change
    create_table :lifters do |t|
      t.string :name
      t.string :name_kana
      t.date :birthday
      t.string :gender

      t.timestamps
    end
  end
end
