class AdministrationController < ApplicationController
    before_action :is_admin?

    def index
        @new_community = Community.new
    end

    def list_communities
        @communities = Community.order('name')
    end

    def list_admins
        @admins = User.where(is_admin: true)
    end

    def give_admin_permissions
        user_email = params[:email]
        user = User.where(email: user_email).first
        raise StandardError, "Usuário não existe" unless user.present?

        user.update(is_admin: true)

        redirect_to administration_path
    end

    def remove_admin_permissions
        admin_id = params[:admin_id]
        admin = User.where(id: admin_id).first
        # byebug arrumar erro (coloca uma exceção personalizada)
        raise StandardError, "Administrador não existe" unless admin.present?

        admin.update(is_admin: false)

        redirect_to administration_path
    end

    private

    def is_admin?
        # byebug arrumar erro (coloca uma exceção personalizada)
        raise StandardError, "aaaaaaaaaaaaaaaaa to com depressão" unless current_user.is_admin
    end
end