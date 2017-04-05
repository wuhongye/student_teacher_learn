class TeachersController < ApplicationController

    def show
        @teachers = Teacher.page(params[:page] || 1).per_page(params[:per_page] || 10).order("id desc")
    end

end