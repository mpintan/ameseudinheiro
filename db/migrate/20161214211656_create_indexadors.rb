class CreateIndexadors < ActiveRecord::Migration
  def change
    create_table :indexadors do |t|
      t.string :nome_indexador

      t.timestamps null: false
    end
  end
end
