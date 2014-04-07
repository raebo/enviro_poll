class CreateNaceCodes < ActiveRecord::Migration
  def change
    create_table :nace_codes do |t|
      t.string :name
      t.timestamps
    end
  end
end
