class Marcado < ApplicationRecord
  belongs_to :user
  belongs_to :candidato

  validates :user_id, :candidato_id, presence: true
end
