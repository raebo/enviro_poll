class RemoveNameFromNaceCodes < ActiveRecord::Migration
  def change
    remove_column :nace_codes, :name, :string
  end
end
