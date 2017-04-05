class StudentsController < ApplicationController

  #  before_action :auth_user, only: [:index]

    def index
        @students = Student.page(params[:page] || 1).per_page(params[:per_page] || 10).order("id desc")
    end

end