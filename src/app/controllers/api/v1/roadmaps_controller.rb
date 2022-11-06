class Api::V1::RoadmapsController < SecuredController
  skip_before_action :authorize_request, only: [:index,:show]

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
    roadmap = @current_user.roadmaps.build(roadmap_params)
    tag_list = params[:tags]
    if roadmap.save_with_tags(tag_list)
      render json: tag_list, status: 200
    else
      # 422 Unprocessable Entity
      #サーバーが要求本文のコンテンツ型を理解でき、要求本文の構文が正しいものの、中に含まれている指示が処理できなかったこと
      render json: roadmap.errors, status: :unprocessable_entity
    end
  end

  def destroy
    roadmap = Roadmap.find(params[:id])
    roadmap.delete
  end

  private

  def roadmap_params
    params.permit(:title,:introduction,:start_skill,:end_skill)
  end
end
