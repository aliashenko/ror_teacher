class CoursesUserController < ApplicationController

  before_action :find_user

  def edit
    @courses = Course.all
  end

  def update
    courses = Course.where(id: params[:courses_ids].map{ |x, y| y })
    @user.courses = courses
    redirect_to users_path
  end

  private

    def find_user
      @user = User.find(params[:id])
    end
end
