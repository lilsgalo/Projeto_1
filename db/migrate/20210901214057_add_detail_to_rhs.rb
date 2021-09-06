class AddDetailToRhs < ActiveRecord::Migration[6.1]
  def change
    add_column :rhs, :idade, :integer
    add_column :rhs, :escolaridade, :string
  end
end
