class AddColumn < ActiveRecord::Migration
  def change
    add_column :videos, :likes_count, :integer, default: 0
  end
end
