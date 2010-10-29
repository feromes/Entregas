class IpFilial

  require 'ipaddr'
    
  FILIAIS = {
    IPAddr.new("192.168.6.0/24") => 13,
    IPAddr.new("192.168.0.0/24") => 1,
    IPAddr.new("192.168.3.0/24") => 2,
    IPAddr.new("192.168.4.0/24") => 4,
    IPAddr.new("192.168.10.0/24") => 21,
    IPAddr.new("192.168.1.0/24") => 15,
    IPAddr.new("192.168.8.0/24") => 8,
    IPAddr.new("192.168.7.0/24") => 10,
    IPAddr.new("192.168.5.0/24") => 19,
    IPAddr.new("192.168.9.0/24") => 9,
    IPAddr.new("192.168.2.0/24") => 3,
  }
  
  attr :filial
  
  def initialize(ip_address)
    @filial = 0
    FILIAIS.each do |k,v|
      @filial = v if k.include? ip_address
    end
  end
  
  def self.filiais
    FILIAIS.map {|k,v| v}.sort
  end
  
end