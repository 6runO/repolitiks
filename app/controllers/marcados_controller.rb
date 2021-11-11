class MarcadosController < ApplicationController
  before_action :set_candidato, only: [:create]
  before_action :set_marcado, only: [:update]

  def create
    @marcado = Marcado.new
    @marcado.user = current_user
    @marcado.candidato = @candidato
    authorize @marcado
    @marcado.save
    redirect_to request.referrer, notice: "#{@candidato.nome_urna} foi marcado(a) com sucesso."
  end

  def update
    desativado = @marcado.desativado
    authorize @marcado
    @marcado.update(desativado: !desativado)
    if desativado
      notice = "#{@marcado.candidato.nome_urna} foi marcado(a) com sucesso."
    else
      notice = "#{@marcado.candidato.nome_urna} foi desmarcado(a) com sucesso."
    end
    redirect_to request.referrer, notice: notice
  end

  private

  def set_candidato
    @candidato = Candidato.find(params[:candidato_id])
  end

  def set_marcado
    @marcado = Marcado.find(params[:id])
  end
end
