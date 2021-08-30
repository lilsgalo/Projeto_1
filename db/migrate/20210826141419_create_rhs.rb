class CreateRhs < ActiveRecord::Migration[6.1]
  def change
    create_table :rhs do |t|
      t.string :nome
      t.string :cpf
      t.string :email
      t.string :telefone
      t.integer :empresa_id

      t.timestamps
    end
  end
end
