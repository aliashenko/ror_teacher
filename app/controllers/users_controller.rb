class UsersController < ApplicationController

  def index
    @students = User.where(user_type: "student").paginate(:page => params[:page], :per_page => 15)
  end

  def show
    @user = User.find(params[:id])
    @courses = @user.courses
  end

  private

    def user_params
      params.require(:user).permit(:avatar)
    end

end
