class AddColmunsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users,:name,:string,null: false
    add_column :users,:github_account,:string
    add_column :users,:twitter_account,:string
  end
end
