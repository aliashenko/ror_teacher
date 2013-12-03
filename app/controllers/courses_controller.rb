class CoursesController < ApplicationController

  def index
    @courses = Course.all.order( name: :asc )
  end

  def show

  end

end
