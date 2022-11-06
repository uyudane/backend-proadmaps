class UserSerializer < ActiveModel::Serializer
  attributes :id, :sub, :name, :github_account, :twitter_account
end
