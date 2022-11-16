module Api::ExceptionHandler
  # includeされた時の処理の記載を楽にする
  extend ActiveSupport::Concern

  # モジュールがincludeされた後に以下のメソッドが動作する
  included do
    rescue_from StandardError, with: :render_500
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
  end

  private

  def render_400(exception = nil, messages = nil)
    render_error(400, "Bad Request", exception&.message, *messages)
  end

  def render_404(exception = nil, messages = nil)
    render_error(404, "Record Not Found", exception&.message, *messages)
  end

  def render_500(exception = nil, messages = nil)
    render_error(500, "Internal Server Error", exception&.message, *messages)
  end

  def render_error(code, message, *error_messages)
    response = {
      message:,
      errors: error_messages.compact
    }

    render json: response, status: code
  end
end
