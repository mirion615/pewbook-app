class Users::SessionsController < Devise::SessionsController
  def guest_sign_inuser = User.guest_sign_in
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
