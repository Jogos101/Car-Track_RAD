# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_08_27_061310) do
  create_schema "car_track"

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "ano_modelos", force: :cascade do |t|
    t.bigint "modelo_id", null: false
    t.bigint "referencia_fipe_id", null: false
    t.string "codigo"
    t.string "nome"
    t.integer "ano"
    t.string "combustivel"
    t.string "combustivel_sigla"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["modelo_id"], name: "index_ano_modelos_on_modelo_id"
    t.index ["referencia_fipe_id"], name: "index_ano_modelos_on_referencia_fipe_id"
  end

  create_table "marcas", force: :cascade do |t|
    t.bigint "referencia_fipe_id", null: false
    t.string "codigo"
    t.string "nome"
    t.integer "tipo_veiculo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["referencia_fipe_id"], name: "index_marcas_on_referencia_fipe_id"
  end

  create_table "modelos", force: :cascade do |t|
    t.bigint "marca_id", null: false
    t.bigint "referencia_fipe_id", null: false
    t.string "codigo"
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marca_id"], name: "index_modelos_on_marca_id"
    t.index ["referencia_fipe_id"], name: "index_modelos_on_referencia_fipe_id"
  end

  create_table "preco_veiculos", force: :cascade do |t|
    t.bigint "ano_modelo_id", null: false
    t.bigint "referencia_fipe_id", null: false
    t.string "codigo_fipe"
    t.integer "ano_modelo_valor_centavos"
    t.string "moeda"
    t.string "mes_referencia"
    t.integer "tipo_veiculo"
    t.jsonb "bruto"
    t.datetime "atualizado_em"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ano_modelo_id"], name: "index_preco_veiculos_on_ano_modelo_id"
    t.index ["referencia_fipe_id"], name: "index_preco_veiculos_on_referencia_fipe_id"
  end

  create_table "referencia_fipes", force: :cascade do |t|
    t.integer "codigo"
    t.string "mes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ano_modelos", "modelos"
  add_foreign_key "ano_modelos", "referencia_fipes"
  add_foreign_key "marcas", "referencia_fipes"
  add_foreign_key "modelos", "marcas"
  add_foreign_key "modelos", "referencia_fipes"
  add_foreign_key "preco_veiculos", "ano_modelos"
  add_foreign_key "preco_veiculos", "referencia_fipes"
end
