class CandidatosController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_candidato, only: [:show]

  def index
    @candidatos = policy_scope(Candidato)
    @candidatos = Candidato.search(params[:search])
  end

  def show
    authorize @candidato
  end

  private

  def set_candidato
    @candidato = Candidato.find(params[:id])
  end

  def candidato_params
    params.require(:candidato).permit(:nome_candidato, :candidato_id, :search)
  end
end
