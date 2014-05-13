class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :result_name

      t.timestamps
    end
  end
end
