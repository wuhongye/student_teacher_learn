class ClassRoom < ActiveRecord::Base

    has_many :users_and_class_rooms, class_name: "UsersAndClassRoom"
    has_many :users, through: :users_and_class_rooms

    validates :roomname, presence: { message: "班级不能为空" }

end
