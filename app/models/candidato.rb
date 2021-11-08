class Candidato < ApplicationRecord
  has_many :marcados
  # has_many :users, through: :marcados  ## Desmarcar esta linha caso seja necessário saber quantos usuários marcaram um candidato
  has_many :informacaos
  # belongs_to :politico

  validates :cpf, :nome_candidato, :email, :nascimento, :grau_instrucao, :ocupacao,
            :partido, :cargo, :estado, :nome_urna, :ano_eleicao, presence: true

  def self.search(search)
    if search
      politico_buscado = Candidato.find_by(nome_candidato: search)
      if politico_buscado
        self.where(candidato_id: politico_buscado)
      else
        @candidatos = Candidato.all
      end
    else
      @candidatos = Candidato.all
    end
  end

end
