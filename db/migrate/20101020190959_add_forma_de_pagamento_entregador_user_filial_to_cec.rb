class AddFormaDePagamentoEntregadorUserFilialToCec < ActiveRecord::Migration
  def self.up
    add_column :cecs, :forma_de_pagamento, :string
    add_column :cecs, :entregador_id, :string
    add_column :cecs, :user_id, :integer
    add_column :cecs, :filial, :integer
  end

  def self.down
    remove_column :cecs, :filial
    remove_column :cecs, :user_id
    remove_column :cecs, :entregador_id
    remove_column :cecs, :forma_de_pagamento
  end
end
