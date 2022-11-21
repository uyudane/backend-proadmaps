class Api::V1::Admin::BaseController < SecuredController
  before_action :check_admin

  private

  def check_admin
    # 開発者のGithubアカウント以外はエラーにする
    render_400()  unless @current_user.sub == "103183815"
  end
end
