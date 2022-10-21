# ベースイメージ
FROM ruby:3.1

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

COPY start.sh /start.sh
RUN chmod 744 /start.sh
CMD ["sh", "/start.sh"]
