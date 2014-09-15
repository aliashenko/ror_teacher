class PagesController < ApplicationController
  before_action :find_course
  before_action :find_page, only: [:show, :edit]

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

  def update
    @page = @course.pages.where(id: (params[:id])).first
    @page.update_attributes(page_params)
    if @page.save
      flash[:success] = "Contect was successfully updated"
      redirect_to course_page_path(@course, @page)
    else
      render 'edit'
    end
  end

  private

  def page_params
    params.require(:page).permit(:id, :course_id, :name, :content)
  end

  def find_course
    @course = Course.find(params[:course_id])
  end

  def find_page
    @page = Page.find(params[:id])
  end

end
