class AddPasswordDigestToCritics < ActiveRecord::Migration
  def change
    add_column :critics, :password_digest, :string
  end
end
