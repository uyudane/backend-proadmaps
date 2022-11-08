class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :name, null: false

      t.timestamps
    end
    # herokuで実施時に「Specified key was too long; max key length is 767 bytes 」のエラーが出たためコメントアウト
    # add_index :tags, :name, unique: true
  end
end
