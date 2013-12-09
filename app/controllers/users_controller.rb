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

  def user_params
    params.require(:user).permit(:avatar)
  end

  def signed_in_user
    redirect_to root_url unless user_signed_in?
  end

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
