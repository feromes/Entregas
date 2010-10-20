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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101020190959) do

  create_table "cecs", :force => true do |t|
    t.string   "nome_do_cliente"
    t.string   "numero_do_pedido"
    t.string   "endereco"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cep"
    t.decimal  "distancia"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.decimal  "valor"
    t.boolean  "comercial"
    t.date     "data_da_entrega"
    t.text     "observacao"
    t.integer  "numero"
    t.string   "forma_de_pagamento"
    t.string   "entregador"
    t.integer  "user_id"
    t.integer  "filial"
  end

end
