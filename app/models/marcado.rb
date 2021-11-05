class Marcado < ApplicationRecord
  belongs_to :user
  belongs_to :candidato

  validates :destroyed, :user_id, :candidato_id, presence: true
end
