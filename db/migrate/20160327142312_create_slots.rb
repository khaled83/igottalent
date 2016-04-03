class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :type
      t.string :genre
      t.references :user, index: true, foreign_key: true
      t.references :video, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
