class PagesController < ApplicationController
  def new
     @course = Course.find(params[:course_id])
     @page   = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:success] = "Page was successfully created"
      redirect_to 'show'
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
end
