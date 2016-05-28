class UsersController < ApplicationController
  # def show
  #   @user = User.find(params[:id])
  #   if params[:code]
  #     @user = User.find_by(code: params[:code])
  #   elsif @user.id != current_user.id
  #     redirect_to root_path, alert: "You don't have permission to do that."
  #   else

  #   end
  # end
  #
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

  # private
  # def premium_params
  #   params.require(:user).permit(:code)
  # end
end
