class AddEndTimeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :end_time, :DateTime
  end
end
