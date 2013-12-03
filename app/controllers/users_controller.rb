class UsersController < ApplicationController

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

end
