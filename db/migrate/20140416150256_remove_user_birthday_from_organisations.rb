class RemoveUserBirthdayFromOrganisations < ActiveRecord::Migration
  def change
    remove_column :organisations, :user_birthday, :string
  end
end
