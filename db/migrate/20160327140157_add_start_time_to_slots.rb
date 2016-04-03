class AddStartTimeToSlots < ActiveRecord::Migration
  def change
    add_column :slots, :start_time, :DateTime
  end
end
