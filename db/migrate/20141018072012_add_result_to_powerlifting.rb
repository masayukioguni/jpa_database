class AddResultToPowerlifting < ActiveRecord::Migration
  def change
    add_column :powerliftings, :result, :float
  end
end
