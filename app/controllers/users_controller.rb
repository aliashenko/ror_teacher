class UsersController < ApplicationController

  def index
    @students = User.where(user_type: "student").paginate(:page => params[:page], :per_page => 15)
  end

  def show
    @user = User.find(params[:id])
    @courses = @user.courses
  end
end
