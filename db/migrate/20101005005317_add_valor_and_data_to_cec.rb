class AddValorAndDataToCec < ActiveRecord::Migration
  def self.up
    add_column :cecs, :valor, :decimal
    add_column :cecs, :comercial, :boolean
    add_column :cecs, :data_da_entrega, :date
  end

  def self.down
    remove_column :cecs, :data_da_entrega
    remove_column :cecs, :comercial
    remove_column :cecs, :valor
  end
end
