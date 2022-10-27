class Api::V1::ProfilesController < SecuredController
  skip_before_action :authorize_request, only: [:index,:show, :update]

  def index
    profiles = Profile.all
    render json: profiles
  end

  def show
    profile = Profile.find(params[:id])
    render json: profile
  end

  def whoami
    profile = @current_user.profile
    render json: profile
  end

  def create
    # ユーザー認証
    # binding.break
    if @current_user.profile
      render json: "OK"
    else
      profile = @current_user.build_profile(profile_params)
      if profile.save
        render json: profile
      else
        render json: profile.errors, status: :unprocessable_entity
      end
    end
  end

  def update
    profile = Profile.find(params[:id])
    if profile.update(profile_params)
      render json: profile
    else
      render json: profile.errors, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.permit(:name,:github_account,:twitter_account)
  end
end
