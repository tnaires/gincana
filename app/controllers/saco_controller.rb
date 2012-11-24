class SacoController < ApplicationController
  def iniciar
    Questao.preparar_todas
    @questao = Questao.first
    render "questao"
  end
  
  def proxima
    questao = Questao.find(params['questao']['id'].to_i)
    questao.tentativa = params['questao']['tentativa']
    questao.save
    
    @questao = Questao.proxima
    
    if @questao
      render "questao"
    else
      redirect_to :pontuacao
    end
  end
  
  def pontuacao
    @resultado = "Voce fez #{Questao.pontuacao} de #{Questao.total} pontos (#{Questao.percentual}%)!"
  end
end
