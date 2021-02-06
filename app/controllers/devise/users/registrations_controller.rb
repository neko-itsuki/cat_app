# frozen_string_literal: true

class Devise::Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,
          keys: [:name, :furigana_name, :age, :gender,
                 :tel, :pets_allowed, :living, :vaccination,
                 :postcode, :prefecture_code, :address_city,
                 :address_street, :address_building])
      
      devise_parameter_sanitizer.permit(:account_update,
          keys: [:name, :furigana_name, :age, :tel, 
                 :postcode, :prefecture_code, :address_city,
                 :address_street, :address_building])
    end
    
    def update_resource(resource, params)
      resource.update_without_password(params)
    end
    
    def after_update_path_for(resource)
      user_path(current_user)
    end
    
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
