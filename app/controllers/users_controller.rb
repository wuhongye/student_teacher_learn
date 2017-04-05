class UsersController < ApplicationController

  def new
    @user = User.new
  end

def create
    @user = User.new
    if params[:user][:mold] == "student" 
         @student = Student.new(user_attrs)
         if @student.save
              flash[:notice] = "注册成功，请登录"
              redirect_to new_session_path
        else
              render action: :new
         end
    elsif params[:user][:mold] == "teacher"
           @teacher = Teacher.new(user_attrs)
           if @teacher.save
              flash[:notice] = "注册成功，请登录"
              redirect_to new_session_path
          else
              render action: :new
          end
    else
        render action: :new
    end
end

  def class_rooms
      @class_rooms = current_user.class_rooms.page(params[:page] || 1).per_page(params[:per_page] || 10)
      .order("id desc")
  end

  private
  def user_attrs
    params.require(:user).permit(:username, :password, :password_confirmation, :mold)
  end

end