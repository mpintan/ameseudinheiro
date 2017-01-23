class CreateCadastros < ActiveRecord::Migration
  def change
    create_table :cadastros do |t|
      t.string :nome
      t.string :sobrenome
      t.string :email

      t.timestamps null: false
    end
  end
end
