class Projeto < ApplicationRecord

  belongs_to :empresa

  validates :nome, presence: true
end