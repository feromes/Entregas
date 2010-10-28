class IpFilial

  require 'ipaddr'
    
  FILIAIS = {
    IPAddr.new("192.168.6.0/24") => 13
  }
  
  attr :filial
  
  def initialize(ip_address)
    @filial = 0
    FILIAIS.each do |k,v|
      @filial = v if k.include? ip_address
    end
  end
  
  
end