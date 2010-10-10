class AddGeoKitFieldsToCec < ActiveRecord::Migration
  def self.up
    add_column :cecs, :distancia, :decimal
    add_column :cecs, :latitude, :decimal
    add_column :cecs, :longitude, :decimal
  end

  def self.down
    remove_column :cecs, :longitude
    remove_column :cecs, :latitude
    remove_column :cecs, :distancia
  end
end
