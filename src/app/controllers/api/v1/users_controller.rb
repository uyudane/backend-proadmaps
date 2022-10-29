class Api::V1::UsersController < SecuredController
  skip_before_action :authorize_request, only: [:index,:show]

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find_by(sub: params[:id])
    render json: user
  end

  # 自身の情報を返す
  def whoami
    user = @current_user
    render json: user
  end

  def update
    user = @current_user
    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name,:github_account,:twitter_account)
  end
end