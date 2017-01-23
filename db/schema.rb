# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161220003103) do

  create_table "cadastros", force: :cascade do |t|
    t.string   "nome"
    t.string   "sobrenome"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "corretoras", force: :cascade do |t|
    t.string   "nome_corretora"
    t.decimal  "taxa_titulo"
    t.decimal  "taxa_TD"
    t.decimal  "taxa_fixa"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "forecast_indexadors", force: :cascade do |t|
    t.integer  "indexador_id"
    t.decimal  "prazo_min"
    t.decimal  "prazo_max"
    t.decimal  "taxa_indexador"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "forecast_indexadors", ["indexador_id"], name: "index_forecast_indexadors_on_indexador_id"

  create_table "impostos", force: :cascade do |t|
    t.integer  "tipo_produto_id"
    t.decimal  "prazo_min"
    t.decimal  "prazo_max"
    t.decimal  "taxa_imposto"
    t.decimal  "taxa_custodia"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "impostos", ["tipo_produto_id"], name: "index_impostos_on_tipo_produto_id"

  create_table "indexadors", force: :cascade do |t|
    t.string   "nome_indexador"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "inflacao_taxas", force: :cascade do |t|
    t.decimal  "prazo_min"
    t.decimal  "prazo_max"
    t.decimal  "taxa_inflacao"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "produtos", force: :cascade do |t|
    t.integer  "corretora_id"
    t.integer  "tipo_produto_id"
    t.string   "banco"
    t.string   "liquidez"
    t.integer  "prazo"
    t.integer  "indexador_id"
    t.decimal  "rentabilidade"
    t.decimal  "valor_minimo"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "produtos", ["corretora_id"], name: "index_produtos_on_corretora_id"
  add_index "produtos", ["indexador_id"], name: "index_produtos_on_indexador_id"
  add_index "produtos", ["tipo_produto_id"], name: "index_produtos_on_tipo_produto_id"

  create_table "tipo_produtos", force: :cascade do |t|
    t.string   "nome_produto"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
