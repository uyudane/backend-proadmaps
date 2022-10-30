class AddSkillsToRoadmap < ActiveRecord::Migration[7.0]
  def change
    add_column :roadmaps,:start_skill,:text
    add_column :roadmaps,:end_skill,:text
  end
end
