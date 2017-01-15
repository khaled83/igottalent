class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :video
      t.integer :user
      t.boolean :liked

      t.timestamps null: false
    end
  end
end
