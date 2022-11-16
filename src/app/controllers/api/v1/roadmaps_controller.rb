# frozen_string_literal: true

class Api::V1::RoadmapsController < SecuredController
  skip_before_action :authorize_request, only: %i[index show]
  before_action :set_roadmap, only: %i[update destroy]

  # 公開済みのロードマップ一覧を返却
  def index
    roadmaps = Roadmap.preload(:user, :tags, :steps).published
    render json: roadmaps, each_serializer: RoadmapSerializer
  end

  def show
    roadmap = Roadmap.preload(:user, :tags, :steps).find(params[:id])
    render json: roadmap, serializer: RoadmapSerializer
  end

  def create
    # ユーザー認証
    roadmap = @current_user.roadmaps.build(roadmap_params)
    tag_list = params[:tags]
    step_list = params[:steps]
    if roadmap.save_with_tags_steps(tag_list:, step_list:)
      render json: tag_list, status: 200
    else
      render_400(nil, roadmap.errors.full_messages)
    end
  end

  def destroy
    roadmap.destroy!
    render json: { status: 200, message: "OK" }
  end

  def update
    # ユーザー認証
    tag_list = params[:tags]
    step_list = params[:steps]
    if roadmap.update_with_tags_steps(tag_list:, step_list:, roadmap_params:)
      render json: tag_list, status: 200
    else
      render_400(nil, roadmap.errors.full_messages)
    end
  end

  private

  def set_roadmap
    roadmap = @current_user.roadmaps.find(params[:id])
  end

  def roadmap_params
    params.permit(:title, :introduction, :start_skill, :end_skill, :id, :is_published)
  end
end
