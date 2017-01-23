class CreateImpostos < ActiveRecord::Migration
  def change
    create_table :impostos do |t|
      t.references :tipo_produto, index: true, foreign_key: true
      t.decimal :prazo_min
      t.decimal :prazo_max
      t.decimal :taxa_imposto
      t.decimal :taxa_custodia

      t.timestamps null: false
    end
  end
end
