class Informacao < ApplicationRecord
  belongs_to :candidato

  validates :titulo, :conteudo, :fonte, :data, :candidato_id, presence: true
end
