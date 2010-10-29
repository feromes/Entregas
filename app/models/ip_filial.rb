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
    IPAddr.new("192.168.2.0/24") => 3
  }
  
  LOCALIZACAO_FILIAL = {
    1 => [-23.583124,-46.637892],
    2 => [-23.541482,-46.410661],
    3 => [-23.542178,-46.576555],
    4 => [-23.525486,-46.712069],
    6 => [-23.536121,-46.77582],
    9 => [-23.635695,-46.695103],
    21 => [-23.655017,-46.702104],
    10 => [-23.543457,-46.690309],
    15 => [-23.612498,-46.66455],
    19 => [-23.504108,-46.622398],
    13 => [-23.5499232, -46.6598365]
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
  
  def self.localizacao_filial(filial)
    LOCALIZACAO_FILIAL[filial]
  end
  
end