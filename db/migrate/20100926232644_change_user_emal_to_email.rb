class ChangeUserEmalToEmail < ActiveRecord::Migration
  def self.up
    rename_column :users, :emal, :email
  end

  def self.down
    rename_column :users, :email, :emal
  end
end
