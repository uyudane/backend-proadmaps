# AuthorizationService は、Authorization HTTP Header に含まれるアクセストークンを取得し、
# それを JsonWebToken に渡して検証を行います。
# https://auth0.com/blog/building-secure-apis-with-rails-6-and-auth0/

class AuthorizationService
  def initialize(headers = {})
    @headers = headers
  end

  # ユーザーモデルメソットを実行し、ユーザー情報を返す
  def current_user
    # binding.b
    @auth_payload, @auth_header = verify_token
    @user = User.from_token_payload(@auth_payload)
  end

  private

  def http_token
    @headers['Authorization'].split(' ').last if @headers['Authorization'].present?
  end

  # json_web_token.rbを実行してTokenを渡す
  def verify_token
    JsonWebToken.verify(http_token)
  end
end
