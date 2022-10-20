class SecuredController < ApplicationController
  # 全てのコントローラー実行前にauthorize_requestを実行
  # authorize_requestではtokneを解析し、ユーザー認証ができなかった場合はエラーメッセージを返す
  before_action :authorize_request

  private

  def authorize_request
    # binding.break
    authorize_request = AuthorizationService.new(request.headers)
    @current_user = authorize_request.current_user
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end
end
