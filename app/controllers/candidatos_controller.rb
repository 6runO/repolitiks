class CandidatosController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_candidato, only: [:show]

  def index
    @candidatos = policy_scope(Candidato)
    # @candidatos = Candidato.search(params[:search])
    if params[:query].present?
      sql_query = "nome_urna ILIKE :query OR nome_candidato ILIKE :query OR partido ILIKE :query OR estado ILIKE :query"
      @candidatos = Candidato.where(sql_query, query: "%#{params[:query]}%")
    else
      @candidatos = Candidato.page(params[:page])
    end
  end

  def show
    authorize @candidato
  end

  private

  def set_candidato
    @candidato = Candidato.find(params[:id])
  end
end
