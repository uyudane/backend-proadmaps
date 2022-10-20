class Api::V1::RoadmapsController < SecuredController
  # skip_before_action :authorize_request, only: [:index,:show]

  def index
    roadmaps = Roadmap.all
    render json: roadmaps
  end

  def show
    roadmap = Roadmap.find(params[:id])
    render json: roadmap
  end

  def create
    # ユーザー認証
    # binding.break
    roadmap = @current_user.roadmaps.build(roadmap_params)

    if roadmap.save
      render json: roadmap
    else
      render json: roadmap.errors, status: :unprocessable_entity
    end
  end

  def destroy
    roadmap = Roadmap.find(params[:id])
    roadmap.delete
  end

  private

  def roadmap_params
    params.permit(:title,:introduction)
  end
end
