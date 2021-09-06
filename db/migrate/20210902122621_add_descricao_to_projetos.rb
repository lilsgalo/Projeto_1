class AddDescricaoToProjetos < ActiveRecord::Migration[6.1]
  def change
    add_column :projetos, :descricao, :text
  end
end
