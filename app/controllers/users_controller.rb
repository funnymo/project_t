class UsersController < ApplicationController
  def show
    if params[:code].nil?
      user = User.find(params[:id])
      if current_user == user
        @user = User.find(current_user.id)
      else
        redirect_to root_path, alert: "You don't have permission to do that"
      end
    else
      @user = User.find_by(code: params[:code])
    end
  end

  def update
    @user = User.find(params[:user_id])
    redirect_to @user
  end
end
