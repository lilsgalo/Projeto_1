class Empresa < ApplicationRecord

  has_many :projetos, dependent: :destroy
  has_many :rhs, dependent: :destroy

  validates :nome, presence: true
  validates :cnpj, presence: true, format: { with: /\d{2}.\d{3}.\d{3}\/\d{4}-\d{2}/ }
  validates :email, format: { with: /[a-z]{1,}@[a-z]{1,}.[a-z]{2,}/}

  accepts_nested_attributes_for :projetos, :rhs
end