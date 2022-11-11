class Api::V1::LikesController < SecuredController
  def create
    roadmap = Roadmap.find(params[:roadmap_id])
    @current_user.like(roadmap)
    render json: { status: 200, message: 'OK'}
  end

  def destroy
    # 要確認:find(params[:roadmap_id])でよい??
    roadmap = @current_user.likes.find(params[:roadmap_id]).roadmap
    @current_user.unlike(roadmap)
    render json: { status: 200, message: 'OK'}
  end
end
