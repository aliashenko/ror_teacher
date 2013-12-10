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

end
