class Candidato < ApplicationRecord
  ESTADOS = ['AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MS','MT','MG',
              'PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO']

  has_many :marcados, dependent: :destroy
  has_many :declarados, dependent: :destroy
  # has_many :users, through: :marcados
  ## Desmarcar esta linha caso seja necessário saber quantos usuários marcaram um candidato
  has_many :informacaos
  has_one_attached :photo
  has_one_attached :proposta
  paginates_per 28

  validates :cpf, :nome_candidato, :email, :nascimento, :grau_instrucao, :ocupacao,
            :partido, :cargo, :estado, :nome_urna, :ano_eleicao, :status_eleicao,
            :sexo, :sq_candidato, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_nome_urna,
    against: :nome_urna,
    using: {
      tsearch: { prefix: true }
    }
end
