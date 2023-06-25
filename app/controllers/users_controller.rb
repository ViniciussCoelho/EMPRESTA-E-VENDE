class UsersController < ApplicationController

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to :edit_user_registration, notice: "Informações atualizadas com sucesso."
      else
        redirect_to :edit_user_registration, notice: "Verifique o preenchiento do nome e do sobrenome"
      end
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :image)
    end
end