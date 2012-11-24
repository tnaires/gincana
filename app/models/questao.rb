class Questao < ActiveRecord::Base
  def self.preparar_todas
    Questao.all.each do |questao|
      questao.tentativa = ""
      questao.save
    end
  end
  
  def self.proxima
    Questao.all.each do |questao|
      return questao if questao.tentativa.empty?
    end
    
    nil
  end
  
  def self.pontuacao
    Questao.all.inject(0) {|soma, questao| soma + (questao.tentativa.downcase == questao.resposta.downcase ? questao.nota : 0)}
  end
  
  def self.total
    Questao.all.inject(0) {|soma, questao| soma + questao.nota}
  end
  
  def self.percentual
    (Questao.pontuacao / Questao.total) * 100
  end
end
