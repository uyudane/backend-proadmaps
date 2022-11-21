class Api::V1::Admin::UsersController < Api::V1::Admin::BaseController

  def index
    users = User.preload(:roadmaps).all
    render json: users, each_serializer: UserSerializer
  end

  def destroy
    user = User.find(params[:id])
    user.destroy!
    render json: { status: 200, message: "OK" }
  end
end
