class AddUserRefToSlots < ActiveRecord::Migration
  def change
    add_reference :slots, :user, index: true, foreign_key: true
  end
end
