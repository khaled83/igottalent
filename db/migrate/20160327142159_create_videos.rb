class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :type
      t.string :genre
      t.string :url
      t.integer :duration_in_seconds
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
