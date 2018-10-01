class Ingresso < ApplicationRecord
  validates :nome, presence: true
  validates :preco, presence: true
  validates :taxa, presence: true
  validates :data, presence: true
end
