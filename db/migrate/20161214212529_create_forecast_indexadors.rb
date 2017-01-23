class CreateForecastIndexadors < ActiveRecord::Migration
  def change
    create_table :forecast_indexadors do |t|
      t.references :indexador, index: true, foreign_key: true
      t.decimal :prazo_min
      t.decimal :prazo_max
      t.decimal :taxa_indexador

      t.timestamps null: false
    end
  end
end
