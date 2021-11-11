class MarcadosController < ApplicationController
  include ActionView::Helpers::UrlHelper

  before_action :set_candidato, only: [:create]
  before_action :set_marcado, only: [:update]

  def create
    @marcado = Marcado.new
    @marcado.user = current_user
    @marcado.candidato = @candidato
    authorize @marcado
    @marcado.save
    path = (current_page?(candidatos_path)) ? candidatos_path : candidato_path(@candidato)
    redirect_to path, notice: "#{@candidato.nome_urna} foi marcado com sucesso."
  end

  def update
    desativado = @marcado.desativado
    authorize @marcado
    @marcado.update(desativado: !desativado)
    if desativado
      notice = "#{@marcado.candidato.nome_urna} foi marcado com sucesso."
    else
      notice = "#{@marcado.candidato.nome_urna} foi desmarcado com sucesso."
    end
    if current_page?(user_root_path)
      path = user_root_path
    elsif current_page?(candidatos_path)
      path = candidatos_path
    else
      path = candidato_path(@marcado.candidato)
    end
    # path = (current_page?(candidatos_path)) ? candidatos_path : (candidato_path(@marcado.candidato))
    redirect_to path, notice: notice
  end

  private

  def set_candidato
    @candidato = Candidato.find(params[:candidato_id])
  end

  def set_marcado
    @marcado = Marcado.find(params[:id])
  end
end
