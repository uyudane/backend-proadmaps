class Api::V1::TagsController < SecuredController
  skip_before_action :authorize_request, only: [:index]

  def index
    tags = Tag.all
    render json: tags
  end
end
