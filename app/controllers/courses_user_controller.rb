class CoursesUserController < ApplicationController

  before_action :find_user

  def edit
    @courses = Course.all.order(name: :asc)
  end

  def update
    courses = Course.where(id: params[:courses_ids].map{ |x, y| y })
    @user.courses = courses
    redirect_to @user
  end

  def start
    @course = Course.find(params[:course_id])
    @user.courses << @course
    redirect_to @course
  end

  private

    def find_user
      @user = User.find(params[:id] || params[:user_id])
    end
end
