class CreateEntregadors < ActiveRecord::Migration
  def self.up
    create_table :entregadors do |t|
      t.string :nome
      t.integer :filial

      t.timestamps
    end
  end

  def self.down
    drop_table :entregadors
  end
end
