class MarcadosController < ApplicationController
  before_action :set_candidato, only: [:create]
  before_action :set_marcado, only: [:update]

  def create
    @marcado = Marcado.new
    @marcado.user = current_user
    @marcado.candidato = @candidato
    authorize @marcado
    @marcado.save
    if current_page?(candidatos_path)   #Se o usuário estiver na index dos candidatos quando marcar,
      path = candidatos_path            #ele continuará lá.
    else                                #Caso não, (estará na página do político e)
      path = candidato_path(@candidato) #ele continuará na página do político.
    end
    redirect_to path, notice: "#{@candidato.nome_urna} foi marcado com sucesso."
  end

  def update
    destroyed = !@marcado.destroyed
    authorize @marcado
    @marcado.update(destroyed: destroyed)
    if destroyed
      notice = "#{@marcado.candidato.nome_urna} foi desmarcado com sucesso."
    else
      notice = "#{@marcado.candidato.nome_urna} foi marcado com sucesso."
    end
    redirect_to user_root_path, notice: notice
  end

  private

  def set_candidato
    @candidato = Candidato.find(params[:candidato_id])
  end

  def set_marcado
    @marcado = Marcado.find(params[:id])
  end
end
