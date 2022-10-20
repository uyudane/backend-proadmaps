class CreateRoadmaps < ActiveRecord::Migration[7.0]
  def change
    create_table :roadmaps do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :introduction

      t.timestamps
    end
  end
end
