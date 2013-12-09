class CoursesController < ApplicationController

  before_action :get_viewable_courses

  def index
    @courses = Course.all.order( name: :asc )
    @user = current_user
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  private

  def get_viewable_courses
    @viewable_courses = []
    if user_signed_in?
      @viewable_courses = if current_user.is_teacher?
        Course.all
      elsif @user
        @user.courses
      else
        current_user.courses
      end
    end
  end

end
