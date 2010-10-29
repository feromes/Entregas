class IpFilial

  require 'ipaddr'
    
  FILIAIS = {
    IPAddr.new("192.168.6.0/24") => 13,
    IPAddr.new("192.168.1.0/24") => 1
    
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