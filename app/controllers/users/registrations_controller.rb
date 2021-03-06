class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :check_permissions, :only => [:new, :create, :cancel]
  skip_before_filter :require_no_authentication
 
  def check_permissions
    authorize! :create, resource
  end

	# def create
 #    build_resource
 #    if resource.save
 #      if resource.active_for_authentication?
 #        set_flash_message :notice, :signed_up if is_navigational_format?
 #        sign_up(resource_name, resource)
	# 			redirect_to products_path
	# 			#respond_with resource, :location => after_sign_up_path_for(resource)
 #      else
 #        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
 #        expire_session_data_after_sign_in!
 #        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
 #      end
 #    else
 #      clean_up_passwords resource
 #      respond_with resource
 #    end
 #  end

 	def sign_up(resource_name, resource)
    return
  end

  def update
    super
  end

end