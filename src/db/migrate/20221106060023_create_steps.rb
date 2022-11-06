class CreateSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :steps do |t|
      t.references :roadmap, null: false, foreign_key: true
      t.text :url
      t.string :title, null: false
      t.text :introduction
      t.string :required_time
      t.string :year
      t.string :month
      t.integer :step_number, null: false

      t.timestamps
    end
  end
end
