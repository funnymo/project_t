class UsersController < ApplicationController

  def create
    @user = User.new( user_params )
    @user.code = User.code_generator
    if @user.save
        redirect_to @user
    else
        render :new
    end
  end

  def show
    @user = User.find_by(code: params[:code])
    if @user.nil?
      redirect_to "/"
    else
      @user.errors.full_messages
    end

  end

  def update
    @user = User.find(params[:user_id])
    @user.update(premium_params)
    redirect_to @user
  end

  private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

  def user_params
    params.require(:user).permit(:avatar)
  end


  def premium_params
    params.require(:user).permit(:code)
  end

end
