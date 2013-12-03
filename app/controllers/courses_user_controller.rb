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

  private

    def find_user
      @user = User.find(params[:id])
    end
end
