class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
   
  end
  
  def update
    @user = User.find(params[:user_id])
    @user.update(premium_params)
    @user.premium = true
    redirect_to product_path(1)
  end


  private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.


  def premium_params
    params.require(:user).permit(:code)
  end

end
