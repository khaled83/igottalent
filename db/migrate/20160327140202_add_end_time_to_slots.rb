class AddEndTimeToSlots < ActiveRecord::Migration
  def change
    add_column :slots, :end_time, :DateTime
  end
end
