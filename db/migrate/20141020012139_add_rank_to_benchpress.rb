class AddRankToBenchpress < ActiveRecord::Migration
  def change
    add_column :benchpresses, :rank, :integer
  end
end
