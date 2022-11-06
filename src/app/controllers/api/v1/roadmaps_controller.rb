class Api::V1::RoadmapsController < SecuredController
  skip_before_action :authorize_request, only: [:index,:show]

  def index
    # ロードマップのIDをキーにして、dataの中に
    # ロードマップの情報(id,title,introduction,start_skill,end_skill,created_at,update_at)と、
    # 関連づけられている情報(User,Tags,Steps)を渡す。
    data = []
    Roadmap.preload(:user,:tags,:steps).all.each do |roadmap|
      tmp = {}
      tmp.store("roadmap",roadmap)
      tmp.store("user",roadmap.user)
      tmp.store("tags",roadmap.tags)
      tmp.store("steps",roadmap.steps)
      data << tmp
    end
    render json: data
  end

  def show
    roadmap = Roadmap.find(params[:id])
    render json: roadmap
  end

  def create
    # ユーザー認証
    roadmap = @current_user.roadmaps.build(roadmap_params)
    tag_list = params[:tags]
    step_list = params[:steps]
    if roadmap.save_with_tags_steps(tag_list: tag_list,step_list: step_list)
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
