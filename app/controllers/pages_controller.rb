class PagesController < ApplicationController
  before_action :find_course

  def new
     @page = @course.pages.new
  end

  def create
    @page = @course.pages.new(page_params)
    if @page.save
      flash[:success] = "Page was successfully created"
      redirect_to course_page_path(@course, @page)
    else
      render 'new'
    end
  end

  def show
    @page = Page.find(params[:id])
  end

  private

  def page_params
    params.require(:page).permit(:id, :course_id, :name, :content)
  end

  def find_course
    @course = Course.find(params[:course_id])
  end
end
