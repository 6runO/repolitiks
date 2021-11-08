class Marcado < ApplicationRecord
  belongs_to :user
  belongs_to :candidato

  validates :destroyed, :user_id, :candidato_id, presence: true

  before_save :default_values

  def default_values
    self.destroyed = false
  end
end
