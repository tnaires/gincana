class CreateQuestoes < ActiveRecord::Migration
  def change
    create_table :questoes do |t|
      t.string :imagem
      t.string :resposta
      t.integer :nota

      t.timestamps
    end
  end
end
