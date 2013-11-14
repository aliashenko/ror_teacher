class UsersController < ApplicationController

  def index
    @students = User.where(user_type: "student")
  end

  def show
    @user = User.find(params[:id])
    @courses = @user.courses
  end
end
