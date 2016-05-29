class UsersController < ApplicationController
  def show
    if current_user.id == params[:id] && params[:code].nil?
      redirect_to root_path, alert: "You don't have permission to do that"
    elsif params[:code].nil? && current_user.id == params[:id]
      @user = User.find_by(idcurrent_user.id)
    elsif params[:code]
      @user = User.find_by(code: params[:code])
    end
  end

  def update
    @user = User.find(params[:user_id])
    redirect_to @user
  end

  # private
  # def premium_params
  #   params.require(:user).permit(:code)
  # end
end
