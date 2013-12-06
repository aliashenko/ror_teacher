class CoursesController < ApplicationController

  before_action :teacher_courses

  def index
    @courses = Course.all.order( name: :asc )
    @user = current_user
  end

  def show
    @course = Course.find(params[:id])
  end

  private

  def teacher_courses
    current_user.courses = Course.all if user_signed_in? && current_user.is_teacher?
  end

end
