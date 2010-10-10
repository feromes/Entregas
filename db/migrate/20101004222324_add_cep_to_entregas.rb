class AddCepToEntregas < ActiveRecord::Migration
  def self.up
    add_column :cecs, :cep, :string
  end

  def self.down
    remove_column :cecs, :cep
  end
end
