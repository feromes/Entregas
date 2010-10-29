class AddAtivoToEntregador < ActiveRecord::Migration
  def self.up
    add_column :entregadors, :ativo, :boolean
  end

  def self.down
    remove_column :entregadors, :ativo
  end
end
