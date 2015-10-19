class AddApiTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :api_token, :string, null: false, index: { unique: true }
  end
end
