class ClassRoomsController < ApplicationController
    
    before_filter :auth_user, except: [:index, :show]

  def index
    @class_rooms = ClassRoom.page(params[:page] || 1).per_page(params[:per_page] || 10).
      order("id desc")
  end

  def new
    @class_room = ClassRoom.new
  end

  def create
    @class_room = current_user.class_rooms.new(class_room_attrs)
    if @class_room.save
      flash[:notice] = "创建成功"
      redirect_to class_rooms_path
    else
      flash[:notice] = "创建失败"
      render action: :new
    end
  end

  def show
    @class_room = ClassRoom.find params[:id]
  end

  def edit
    @class_room = current_user.class_rooms.find params[:id]
    render action: :new
  end

  def update
    @class_room = current_user.class_rooms.find params[:id]
    @class_room.attributes = class_room_attrs
    if @class_room.save
      flash[:notice] = "更新成功"
      redirect_to class_rooms_path
    else
      flash[:notice] = "更新失败"
      render action: :new
    end
  end

  private
  def class_room_attrs
    params.require(:class_room).permit(:roomname)
  end

end