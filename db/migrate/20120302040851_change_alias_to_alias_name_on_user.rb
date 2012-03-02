class ChangeAliasToAliasNameOnUser < ActiveRecord::Migration
  def change
    rename_column :users, :alias, :alias_name
  end
end
