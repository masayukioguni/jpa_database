class AddFormulaToPowerlifting < ActiveRecord::Migration
  def change
    add_column :powerliftings, :formula, :float
  end
end
