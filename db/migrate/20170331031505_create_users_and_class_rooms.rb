class CreateUsersAndClassRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :users_and_class_rooms do |t|
        t.integer :user_id
        t.integer :class_room_id
        t.belongs_to :user, index: true
        t.belongs_to :class_room, index: true
        t.timestamps null: false
    end
  end
end
