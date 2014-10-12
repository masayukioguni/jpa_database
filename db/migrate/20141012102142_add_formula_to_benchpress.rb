class AddFormulaToBenchpress < ActiveRecord::Migration
  def change
    add_column :benchpresses, :formula, :float
  end
end
