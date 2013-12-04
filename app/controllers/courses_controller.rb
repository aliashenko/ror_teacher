class CoursesController < ApplicationController

  def index
    @courses = Course.all.order( name: :asc )
    @user = current_user
  end

  def show
    @course = Course.find(params[:id])
  end

end
