# ベースイメージ
FROM ruby:3.1.2

# ローカルでは、docker-composeでdevelopmentに上書きされる。
ENV RAILS_ENV=production

# 必要なライブラリのインストール、アップデート(yarn関連)
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y nodejs yarn

# 作業ディレクトリの指定
WORKDIR /app

# ソースコードのコピー
COPY ./src /app

# Ruby関連のインストール
RUN bundle config --local set path 'vendor/bundle' \
  && bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

COPY start.sh /start.sh
RUN chmod 744 /start.sh
CMD ["sh", "/start.sh"]

# # コンテナはポート番号を80で開放する
# EXPOSE 80

# # Railsサーバーが本番環境で起動する(上記ENVで"production"としている)
# CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "80"]
