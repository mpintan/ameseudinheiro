class CreateCorretoras < ActiveRecord::Migration
  def change
    create_table :corretoras do |t|
      t.string :nome_corretora
      t.decimal :taxa_titulo
      t.decimal :taxa_TD
      t.decimal :taxa_fixa

      t.timestamps null: false
    end
  end
end
