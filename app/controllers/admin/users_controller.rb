# frozen_string_literal: true
module Admin
  class UsersController < ApplicationController
    # authorize_resource class: :users

    # before_action :configure_sign_up_params, only: [:create]
    # # before_action :configure_account_update_params, only: [:update]
    # respond_to :json 

    # private 
    
    # def respond_with(resource, _opts = {})
    #   resource.persisted? ? register_success : register_failed
    # end
    # def register_success
    #   render json: { message: 'Signed up.' }
    # end
    # def register_failed
    #   render json: { message: "Signed up failure." }
    # end

    # GET /resource/sign_up
    def new
      # super
      @user = User.new
    end

    # POST /resource
    def create
      begin
        @user = User.new(user_params)
        ActiveRecord::Base.transaction do
          if @user.save            
            flash[:success] = "Cadastro efetuado com sucesso!"

            # render :js => "window.location = '#{current_admin_user.totem? ? totem_admin_users_path : new_admin_user_path}'"       
            redirect_to root
          else
            # @registration.errors.messages.delete(:birthday) if @error_on_birthday.present?
            # @registration.errors.add(:birthday, 'não é válido') if @error_on_birthday.present?
            # @registration.errors.add(:ip_address, I18n.t('errors.messages.locked_ip_addr', count: TIMEOUT_TO_SIGN_UP_AGAIN)) if params.include?("g-recaptcha-response")
            
            flash.now[:error] = 'epa'
            redirect_to new_admin_user_path
          end
        end
      rescue
        @user = User.new

        redirect_to new_admin_user_path
      end
    end

    # def create
    #   if @user.
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

    private 

    def user_params 
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
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
end