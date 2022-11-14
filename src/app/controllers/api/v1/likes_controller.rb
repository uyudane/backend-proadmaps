# ロードマップへのいいね機能
class Api::V1::LikesController < SecuredController
  def create
    roadmap = Roadmap.find(params[:roadmapId])
    @current_user.like(roadmap)
    render json: { status: 200, message: 'OK' }
  end

  def destroy
    # ルーティングでは、idにlikeのIDが入るようになっているが、roadmapIDを渡すようにする
    roadmap = @current_user.likes.find_by(roadmap_id: params[:id]).roadmap
    @current_user.unlike(roadmap)
    render json: { status: 200, message: 'OK' }
  end
end
