class AddStartTimeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :start_time, :DateTime
  end
end
