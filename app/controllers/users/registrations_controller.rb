# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  #   @user.categories = Category.create!([
  #     { title: "Sono", color: "#003487", user_id: @user.id},
  #     { title: "Refeição", color: "#ff8438", user_id: @user.id},
  #     { title: "Exercício físico", color: "#1ce823", user_id: @user.id},
  #     { title: "Lazer", color: "#00e0e0", user_id: @user.id},
  #     { title: "Hobbie", color: "#ac00e0", user_id: @user.id},
  #     { title: "Estudo", color: "#edeb77", user_id: @user.id},
  #     { title: "Trabalho remunerado", color: "#0073ff", user_id: @user.id},
  #     { title: "Trabalho não-remunerado", color: "#82a9ad", user_id: @user.id},
  #     { title: "Rotina", color: "#e6c853", user_id: @user.id}
  #   ])
  
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

  # protected

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
