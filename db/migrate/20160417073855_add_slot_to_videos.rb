class AddSlotToVideos < ActiveRecord::Migration
  def change
    add_reference :videos, :slot, index: true, foreign_key: true
  end
end
