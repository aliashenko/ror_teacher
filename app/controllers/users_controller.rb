class UsersController < ApplicationController

  def index
    @students = User.where(user_type: "student")
  end

end
