class MigratingIpAddressToCec < ActiveRecord::Migration
  def self.up
    Cec.find(:all).each {|c| c.update_attributes(:ip_address => "192.168.6.1", :filial => 13)}
  end

  def self.down
  end
end
