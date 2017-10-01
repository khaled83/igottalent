class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :likes, :video, :video_id
  end
end
