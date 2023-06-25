class PasswordsController < Devise::PasswordsController
    
    def update
        @user = current_user
        
        if params[:user][:password] != params[:user][:password_confirmation]
            flash[:alert] = "Senha e confirmação são diferentes"
            redirect_to edit_user_registration_path and return
        end

        if params[:user][:password].present?
          if current_user.update(user_params)
            flash[:notice] = "User information and password were successfully updated."
          else
            flash[:alert] = "Failed to update user information and password."
          end
        else
          current_user.update(user_params)
          flash[:notice] = "User information was successfully updated."
        end
      
        redirect_to root_path
      end
      

    def user_params
        params.require(:user).permit(:password, :password_confirmation)
    end
  
  end
  