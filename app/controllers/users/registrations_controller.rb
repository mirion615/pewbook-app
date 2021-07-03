class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: [:update, :destroy]
  before_action :configure_account_update_params, only: [:update]

  def ensure_normal_user
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert:'ゲストユーザーの更新・削除はできません'
    end
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

end
