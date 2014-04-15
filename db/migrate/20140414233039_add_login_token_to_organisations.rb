class AddLoginTokenToOrganisations < ActiveRecord::Migration
  def change
    add_column :organisations, :login_token, :string
  end
end
