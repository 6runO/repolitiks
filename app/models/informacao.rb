class Informacao < ApplicationRecord
  belongs_to :candidato

  validates :titulo, :conteudo, :fonte, :data, :candidato_id, presence: true
  # validates uniqueness combinado titulo e fonte?
end
