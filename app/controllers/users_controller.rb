class UsersController < ApplicationController

  before_action :signed_in_user, only: [:index, :show]
  before_action :get_viewable_courses

  def index
    @students = User.where(user_type: "student").paginate(:page => params[:page], :per_page => 15).order(last_name: :asc)
  end

  def show
    @user = User.find(params[:id])
    @courses = @user.courses.order(name: :asc)
  end

  private

  def signed_in_user
    redirect_to root_url unless user_signed_in?
  end

end
