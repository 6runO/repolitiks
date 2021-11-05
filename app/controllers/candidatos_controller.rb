class CandidatosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_candidato, only: [:show]

  def index
    @candidatos = policy_scope(Candidato)
  end

  def show
    authorize @candidato
  end

  private

  def set_candidato
    @candidato = Candidato.find(params[:id])
  end
end
