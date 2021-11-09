class Candidato < ApplicationRecord
  has_many :marcados
  # has_many :users, through: :marcados
  ## Desmarcar esta linha caso seja necessário saber quantos usuários marcaram um candidato
  has_many :informacaos

  validates :cpf, :nome_candidato, :email, :nascimento, :grau_instrucao, :ocupacao,
            :partido, :cargo, :estado, :nome_urna, :ano_eleicao, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_nome_urna,
    against: :nome_urna,
    using: {
      tsearch: { prefix: true }
    }
  
  def self.search(search)
    if search
      politico_buscado = Candidato.find_by(nome_urna: search)
      if politico_buscado
        self.where(nome_urna: politico_buscado)
      else
        @candidatos = Candidato.all
      end
    else
      @candidatos = Candidato.all
    end
  end

end
