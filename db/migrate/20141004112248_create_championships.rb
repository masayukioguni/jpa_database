class CreateChampionships < ActiveRecord::Migration
  def change
    create_table :championships do |t|
      t.string :name
      t.date :start_at
      t.date :end_at
      t.string :place
      t.boolean :is_breakable_japanese_record

      t.timestamps
    end
  end
end
