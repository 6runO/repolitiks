class CandidatosController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_candidato, only: [:show]

  def index
    @candidatos = policy_scope(Candidato)
    # @candidatos = Candidato.search(params[:search])
    if params[:query].present?
      sql_query = "nome_urna ILIKE :query OR nome_candidato ILIKE :query
      OR partido ILIKE :query OR estado ILIKE :query OR cargo ILIKE :query"
      @candidatos = Candidato.where(sql_query, query: "%#{params[:query]}%").page(params[:page])
    else
      if params[:nome].present? || params[:cargo].present? || params[:partido].present? || params[:estado].present? || params[:eleito].present?
        nome = (params[:nome].present?) ? params[:nome] : ""
        cargo = (params[:cargo].present?) ? params[:cargo] : ""
        partido = (params[:partido].present?) ? params[:partido] : ""
        estado = (params[:estado].present?) ? params[:estado] : ""

        sql_query = "(nome_urna ILIKE :nome OR nome_candidato ILIKE :nome)
        AND cargo ILIKE :cargo AND partido ILIKE :partido
        AND estado ILIKE :estado"
        @candidatos = Candidato.where(sql_query, nome: "%#{nome}%",
                                      cargo: "%#{cargo}%",
                                      partido: "%#{partido}%",
                                      estado: "%#{estado}%").page(params[:page])
      else
        @candidatos = Candidato.page params[:page]
      end
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
