class AddColumnsToNaceCodes < ActiveRecord::Migration
  def change
    add_column :nace_codes, :code, :string
    add_column :nace_codes, :description, :string
  end
end
