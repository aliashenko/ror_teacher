class CoursesController < ApplicationController

  before_action :get_viewable_courses
  before_action :find_course, only: [:show, :edit]

  def index
    @courses = Course.all.order( name: :asc )
    @user = current_user
  end

  def show
    @pages  = @course.pages
  end

  private

  def find_course
    @course = Course.find(params[:id])
  end

end
