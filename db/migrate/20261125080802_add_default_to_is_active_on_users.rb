class AddDefaultToIsActiveOnUsers < ActiveRecord::Migration[8.1]
  def change
    change_column_default :users, :is_active, from: nil, to: true
    change_column_null :users, :is_active, false
  end
end
