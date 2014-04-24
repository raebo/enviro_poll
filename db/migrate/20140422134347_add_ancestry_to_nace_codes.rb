class AddAncestryToNaceCodes < ActiveRecord::Migration
  def change
    add_column :nace_codes, :ancestry, :string
  end

  def self.up  
    add_column :nace_codes, :ancestry, :string  
    add_index :nace_codes, :ancestry  
  end  
  
  def self.down  
    remove_index :nace_codes, :ancestry  
    remove_column :nace_codes, :ancestry  
  end  
end
