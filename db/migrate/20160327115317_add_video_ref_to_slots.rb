class AddVideoRefToSlots < ActiveRecord::Migration
  def change
    add_reference :slots, :Video, index: true, foreign_key: true
  end
end
