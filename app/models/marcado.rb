class Marcado < ApplicationRecord
  belongs_to :user
  belongs_to :candidato

  validates :user_id, :candidato_id, presence: true
  validates :user_id, uniqueness: { scope: :candidato_id,
    message: "este candidato já foi marcado anteriormente" }
end
