class AddFbUserIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fb_user_id, :string
  end
end
