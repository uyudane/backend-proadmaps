class Api::V1::Admin::RoadmapsController < Api::V1::Admin::BaseController

  # ロードマップ一覧を返却
  def index
    roadmaps = Roadmap.preload(:user, :tags, :steps).order(id: "DESC")
    render json: roadmaps, each_serializer: RoadmapSerializer
  end

  # 指定したIDのロードマップを削除
  def destroy
    roadmap = Roadmap.find(params[:id])
    roadmap.destroy!
    render json: { status: 200, message: "OK" }
  end

end
