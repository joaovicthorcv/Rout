module API
    module V1
        class RegistrationsController < Devise::RegistrationsController
            before_action :ensure_params_exist, only: :create
            # skip_before_filter :verify_authenticity_token, :only => :create
            # sign up
            def create
                user = User.new user_params
                if user.save
                    render json: {
                    messages: "Sign Up Successfully",
                    is_success: true,
                    data: {user: user, token: user.generate_jwt}
                    }, status: :ok
                else
                    render json: {
                    messages: "Sign Up Failded",
                    is_success: false,
                    data: {errors: user.errors}
                    }, status: :unprocessable_entity
                end
            end
        
            private
        
            def user_params
                params.require(:user).permit(:name, :email, :password, :password_confirmation)
            end
        
            def ensure_params_exist
                return if params[:user].present?
                render json: {
                    messages: "Missing Params",
                    is_success: false,
                    data: {}
                    }, status: :bad_request
            end
        end
    end 
end 