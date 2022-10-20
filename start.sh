if [ "${RAILS_ENV}" = "production" ]
then
    bundle exec rails assets:precompile  #本番環境の時だけ、アセットパイプラインに追加する処理が必要
fi

bundle exec rails s -p ${PORT:-3000} -b 0.0.0.0 # railsサーバを起動している　portがあればそれ、なければ3000番
