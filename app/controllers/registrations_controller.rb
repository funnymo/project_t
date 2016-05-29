class RegistrationsController < Devise::RegistrationsController

	# def create

 #    build_resource(sign_up_params)
 #    resource.save
 #    yield resource if block_given?
 #    if resource.persisted?

 #      if resource.active_for_authentication?
 #        set_flash_message! :notice, :signed_up
 #        sign_up(resource_name, resource)
 #        respond_with resource, location: after_sign_up_path_for(resource)
 #      else
 #        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
 #        expire_data_after_sign_in!
 #        respond_with resource, location: after_inactive_sign_up_path_for(resource)
 #      end
 #    else
 #      clean_up_passwords resource
 #      set_minimum_password_length
 #      respond_with resource
 #    end
 #  end


  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def sign_up_params
    params.require(:user).permit(:fullname, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(
      :avatar,
      :fullname,
      :phone_number,
      :description,
      :interest,
      :email,
      :password,
      :password_confirmation,
      :code,
      :image,
      :facebook,
      :github,
      :google,
      :twitter,
      :twitch,
      :snapchat,
      :youtube,
      :tripadvisor,
      :linkedin,
      :instagram)
  end
end
