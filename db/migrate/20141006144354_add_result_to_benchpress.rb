class AddResultToBenchpress < ActiveRecord::Migration
  def change
    add_column :benchpresses, :result, :float
  end
end
