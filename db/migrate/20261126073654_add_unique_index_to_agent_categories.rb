class AddUniqueIndexToAgentCategories < ActiveRecord::Migration[8.1]
  def change
    add_index :agent_categories, [ :agent_id, :category_id ], unique: true
  end
end
