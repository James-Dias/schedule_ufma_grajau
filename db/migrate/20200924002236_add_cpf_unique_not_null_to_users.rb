class AddCpfUniqueNotNullToUsers < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :cpf, unique: true
    change_column_null :users, :cpf, null: false
  end
end
