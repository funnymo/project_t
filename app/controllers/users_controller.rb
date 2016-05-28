class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
=======
   
>>>>>>> origin/debugger
  end
>>>>>>> Stashed changes

  def update
    @user = User.find(params[:user_id])
    redirect_to @user
  end

  private
  def premium_params
    params.require(:user).permit(:code)
  end
end
