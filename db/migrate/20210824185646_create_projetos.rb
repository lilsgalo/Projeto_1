class CreateProjetos < ActiveRecord::Migration[6.1]
  def change
    create_table :projetos do |t|
      t.string :nome
      t.integer :valor
      t.integer :empresa_id

      t.timestamps
    end
  end
end
