class CreateEmpresas < ActiveRecord::Migration[6.1]
  def change
    create_table :empresas do |t|
      t.string :nome
      t.string :cnpj
      t.string :email

      t.timestamps
    end
  end
end
