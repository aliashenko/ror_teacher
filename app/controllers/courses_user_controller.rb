class CoursesUserController < ApplicationController

  before_action :find_user

  def new
    @courses = Course.all
  end

  def create
    existing_courses = @user.courses
    courses = Course.where(id: params[:courses_ids].map{ |x, y| y })
    @user.courses << (courses - existing_courses)
    redirect_to users_path
  end

  def destroy
    course_user = @user.courses_users.where(course_id: params[:id]).first
    @course = Course.find(params[:id])
    respond_to do |format|
      format.js do
        course_user.destroy
      end
    end
  end

  private

    def find_user
      @user = User.find(params[:user_id])
    end
end
