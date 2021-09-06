class AddContatoToEmpresas < ActiveRecord::Migration[6.1]
  def change
    add_column :empresas, :nome_contato, :string
    add_column :empresas, :email_contato, :string
  end
end
