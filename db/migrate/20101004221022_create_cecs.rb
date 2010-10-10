class CreateCecs < ActiveRecord::Migration
  def self.up
    create_table :cecs do |t|
      t.string :nome_do_cliente
      t.string :numero_do_pedido
      t.string :endereco
      t.string :complemento
      t.string :bairro
      t.string :cidade

      t.timestamps
    end
  end

  def self.down
    drop_table :cecs
  end
end
