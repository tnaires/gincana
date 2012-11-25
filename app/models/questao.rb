class Questao < ActiveRecord::Base
  def self.preparar_todas
    Questao.all.each do |questao|
      questao.tentativa = ""
      questao.save
    end
  end
  
  def self.proxima
    Questao.all.find {|questao| questao.tentativa.empty?}
  end
  
  def self.pontuacao
    Questao.all.select {|questao| questao.tentativa.downcase == questao.resposta.downcase}.map(&:nota).reduce(:+)
  end
  
  def self.total
    Questao.all.map(&:nota).reduce(:+)
  end
  
  def self.percentual
    (Questao.pontuacao.to_f / Questao.total) * 100
  end
end
