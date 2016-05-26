class UsersController < ApplicationController


  def show
    @user = User.find_by(code: params[:code])
    if @user.nil?
      redirect_to "/"
    else
      @user.errors.full_messages
    end

  end

  private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.


  def premium_params
    params.require(:user).permit(:code)
  end

end
