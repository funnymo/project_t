class UsersController < ApplicationController

  def show
    @user = User.find_by(code: params[:code]) || User.find(params[:id])
    if @user.nil?
      redirect_to "/"
    end
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
