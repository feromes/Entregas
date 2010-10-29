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

ActiveRecord::Schema.define(:version => 20101029153101) do

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
    t.string   "entregador_id"
    t.integer  "user_id"
    t.integer  "filial"
    t.string   "ip_address"
  end

  create_table "entregadors", :force => true do |t|
    t.string   "nome"
    t.integer  "filial"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "ativo"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
