class UsersAndClassRoom < ActiveRecord::Base

    self.table_name = 'users_and_class_rooms'

    validates_uniqueness_of :user_id, scope: [:class_room_id]

    belongs_to :user
    belongs_to :class_room
end
