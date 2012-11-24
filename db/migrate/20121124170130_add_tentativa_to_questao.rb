class AddTentativaToQuestao < ActiveRecord::Migration
  def change
    add_column :questoes, :tentativa, :string
  end
end
