class CreateAgentCategories < ActiveRecord::Migration[8.1]
  def change
    create_table :agent_categories do |t|
      t.references :agent, null: false, foreign_key: { to_table: :users }
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
