# frozen_string_literal: true

class Api::V1::RoadmapsController < SecuredController
  skip_before_action :authorize_request, only: %i[index show]

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
      # 422 Unprocessable Entity
      # サーバーが要求本文のコンテンツ型を理解でき、要求本文の構文が正しいものの、中に含まれている指示が処理できなかったこと
      render json: roadmap.errors, status: :unprocessable_entity
    end
  end

  def destroy
    roadmap = @current_user.roadmaps.find(params[:id])
    roadmap.destroy
    render json: { status: 200, message: 'OK' }
  end

  def update
    # ユーザー認証
    roadmap = @current_user.roadmaps.find(params[:id])
    tag_list = params[:tags]
    step_list = params[:steps]
    if roadmap.update_with_tags_steps(tag_list:, step_list:, roadmap_params:)
      render json: tag_list, status: 200
    else
      # 422 Unprocessable Entity
      # サーバーが要求本文のコンテンツ型を理解でき、要求本文の構文が正しいものの、中に含まれている指示が処理できなかったこと
      render json: roadmap.errors, status: :unprocessable_entity
    end
  end

  private

  def roadmap_params
    params.permit(:title, :introduction, :start_skill, :end_skill, :id, :is_published)
  end
end
