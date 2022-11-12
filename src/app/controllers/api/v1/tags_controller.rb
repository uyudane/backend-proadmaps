class Api::V1::TagsController < SecuredController
  skip_before_action :authorize_request, only: [:index]

  # 下書きのタグは変なものが入っている可能性がある+検索に使用したくないため、
  # 公開済みのロードマップに付けられているタグのみを返す
  def index
    roadmaps = Roadmap.preload(:tags).published
    publishd_roadmap_tags_id = []
    roadmaps.each do |roadmap|
      roadmap.tags.each do |tag|
        publishd_roadmap_tags_id << (tag.id)
      end
    end
    tags = []
    publishd_roadmap_tags_id.uniq.each do |id|
      tags << Tag.find(id)
    end
    render json: tags, each_serializer: TagSerializer
  end
end
