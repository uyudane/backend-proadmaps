class CreateRoadmapTags < ActiveRecord::Migration[7.0]
  def change
    create_table :roadmap_tags do |t|
      t.references :roadmap, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
    add_index :roadmap_tags, %i[tag_id roadmap_id], unique: true
  end
end
