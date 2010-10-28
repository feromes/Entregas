class AddIpAddressToCec < ActiveRecord::Migration
  def self.up
    add_column :cecs, :ip_address, :string
  end

  def self.down
    remove_column :cecs, :ip_address
  end
end
