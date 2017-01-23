class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.references :corretora, index: true, foreign_key: true
      t.references :tipo_produto, index: true, foreign_key: true
      t.string :banco
      t.string :liquidez
      t.integer :prazo
      t.references :indexador, index: true, foreign_key: true
      t.decimal :rentabilidade
      t.decimal :valor_minimo

      t.timestamps null: false
    end
  end
end
