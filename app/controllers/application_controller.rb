# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, { except: [:top] }

  # デバイス機能実行前にconfigure_permitted_parametersの実行をする。
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(_resource)
    user_path(current_user.id)
  end

  def after_sign_up_path_for(_resource)
    user_path(current_user.id) # ログイン後に遷移するpathを設定
  end

  # sign_out後のredirect先変更する。rootパスへ。rootパスはhome topを設定済み。
  def after_sign_out_path_for(_resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[account_name email nationality])
    # sign_upの際にnameのデータ操作を許。追加したカラム。
  end
end
# refactoring を考慮
