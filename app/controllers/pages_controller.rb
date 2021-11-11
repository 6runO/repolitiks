class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def minha
    @candidatos = current_user.candidatos.select do |candidato|
      candidato.marcados.find_by(user_id: current_user).desativado == false
    end
  end
end
