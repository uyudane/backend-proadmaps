class AddColumnToRoadmaps < ActiveRecord::Migration[7.0]
  def change
    add_column :roadmaps, :is_published, :boolean, default: false, null: false
  end
end
