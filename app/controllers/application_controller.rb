class ApplicationController < ActionController::Base
    # 全ページをログイン必須とする
    before_action :authenticate_user!
end

def check_guest
    email = resource&.email || params[:user][:email].downcase
    if email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの変更・削除はできません。'
    end
end
