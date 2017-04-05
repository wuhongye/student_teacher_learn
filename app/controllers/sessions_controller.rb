class SessionsController < ApplicationController

  def new
    
  end

  def create
    @user = User.authenticate(params[:username], params[:password])
    if @user
      signin_user @user
      if params[:mold].eql? 'student'
             redirect_to  students_path
      else
              redirect_to teachers_path
      end
      # render json: {
      #   status: 'ok',
      #   msg: {
      #     redirect_url: root_path
      #   }
      # }
    else
      # render json: {
      #   status: 'error',
      #   msg: "用户名或密码不正确"
      # }
      flash[:notice] = "用户名或密码不正确"
    end
  end

  def destroy
    logout_user
    
    flash[:notice] = "退出成功"
    redirect_to root_path
  end
end