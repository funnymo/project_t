class UsersController < ApplicationController
  def create
  	@user = User.create(params[:user])
 
    #respond_to do |format|
      if @user.save
      	byebug
        # Tell the UserMailer to send a welcome email after save
        UserMailer.registration_confirmation(@user).deliver_now
 
        #format.html { redirect_to(@user, notice: 'User was successfully created.') }
        #format.json { render json: @user, status: :created, location: @user }
        redirect_to root_path
      else
        #format.html { render action: 'new' }
        #format.json { render json: @user.errors, status: :unprocessable_entity } 
        redirect_to new_user_session_path
      end
    end
  end
  def confirm_email
  	user= User.find_by_confirm_token(params[:id])
  	if user_params
  		user.email_activate
  		flash[:succes] = "Welcome to my Trail"
  		redirect_to root_path
  	else
  		flash[:error]= 'Error: user do not exits'
  		redirect_to root_path
  	end
  end
  
  def show
    @user = User.find(params[:id])
  end
end
