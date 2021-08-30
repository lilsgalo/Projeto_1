class Rh < ApplicationRecord

  belongs_to :empresa

  validates :nome, presence: true
  validates :cpf, presence: true, format: { with: /\d{3}.\d{3}.\d{3}-\d{2}/ }
  validates :telefone, format: { with: /\(\d{2}\)\d{5}-\d{4}/ }
end