class RemoveUserTitleFromOrganisations < ActiveRecord::Migration
  def change
    remove_column :organisations, :user_title, :string
  end
end
