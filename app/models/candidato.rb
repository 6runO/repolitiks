class Candidato < ApplicationRecord
  has_many :marcados
  has_many :informacaos

  validates :cpf, :nome_candidato, :email, :nascimento, :grau_instrucao, :ocupacao,
            :partido, :cargo, :estado, :nome_urna, :ano_eleicao, presence: true
end
