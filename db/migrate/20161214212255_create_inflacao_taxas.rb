class CreateInflacaoTaxas < ActiveRecord::Migration
  def change
    create_table :inflacao_taxas do |t|
      t.decimal :prazo_min
      t.decimal :prazo_max
      t.decimal :taxa_inflacao

      t.timestamps null: false
    end
  end
end
