class CreateTipoProdutos < ActiveRecord::Migration
  def change
    create_table :tipo_produtos do |t|
      t.string :nome_produto

      t.timestamps null: false
    end
  end
end
