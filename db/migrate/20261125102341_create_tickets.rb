class CreateTickets < ActiveRecord::Migration[8.1]
  def change
    create_table :tickets do |t|
      t.string :subject, null: false
      t.text :description, null: false
      t.string :status, null: false
      # Rails assumes that customer_id references a customers table. But we don't have a customers table. Customers are stored in our users table
      # this tells PostgreSQL that both customer_id and assigned_to_id must reference users.id.
      t.references :customer, null: false, foreign_key: { to_table: :users }
      t.references :assigned_to, null: true, foreign_key: { to_table: :users }
      # yesma category bhanney table xa so it is a foreign key as category_id
      t.references :category, null: false, foreign_key: true
      t.datetime :resolved_at
      t.datetime :closed_at

      t.timestamps
    end
  end
end
