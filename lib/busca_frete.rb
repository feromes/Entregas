require 'net/http'

class BuscaFrete
  @@servico_padrao = :correios
  @@cep_origem_padrao = nil
  
  FRETE_PARAMS = {
    :w21studio => {
      :tipo => {:sedex => 1, :pac => 2},
      :url => Proc.new {|options| "http://frete.w21studio.com/calFrete.xml?cep=#{options[:para]}&cod=#{options[:de]}&peso=#{options[:peso]}&comprimento=#{options[:comprimento]}&largura=#{options[:largura]}&altura=#{options[:altura]}&servico=#{FRETE_PARAMS[:w21studio][:tipo][options[:tipo]]}" },
      :match => {:pac => '<valor_pac>(.*)</valor_pac>', :sedex => '<valor_sedex>(.*)</valor_sedex>', :erro => '', :erro_mensagem => '<status>(.*)</status>'}      
    },
    :correios => {
      :tipo => {:sedex => 40010, :pac => 41106},
      :url => Proc.new {|options| "http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?nCdEmpresa=&sDsSenha=&sCepOrigem=#{options[:de]}&sCepDestino=#{options[:para]}&nVlPeso=#{options[:peso]}&nCdFormato=1&nVlComprimento=#{options[:comprimento]}&nVlAltura=#{options[:altura]}&nVlLargura=#{options[:largura]}&sCdMaoPropria=n&nVlValorDeclarado=0&sCdAvisoRecebimento=n&nCdServico=#{FRETE_PARAMS[:correios][:tipo][options[:tipo]]}&nVlDiametro=0&StrRetorno=xml" },
      :match => {:pac => '<Valor>(.*)</Valor>', :sedex => '<Valor>(.*)</Valor>', :erro => '<Erro>(.*)</Erro>', :erro_mensagem => '<MsgErro>(.*)</MsgErro>'}      
    }
  }

  
  class << self
    def servico_padrao
      @@servico_padrao
    end

    def servico_padrao=(servico)
      @@servico_padrao=servico
    end

    def cep_origem_padrao
      @@cep_origem_padrao
    end

    def cep_origem_padrao=(cep)
      @@cep_origem_padrao=cep
    end
  end
  
  def self.valor_pac(options)
    self.valor :pac, options
  end
  
  def self.valor_sedex(options)
    self.valor :sedex, options
  end
  
  def self.valor(tipo, options)
    options = setar_parametros_default(options).merge(:tipo => tipo)
    
    begin
      url = FRETE_PARAMS[@@servico_padrao][:url].call(options)
      response = Net::HTTP.get_response(URI.parse( url )).body
      
      if @@servico_padrao == :correios
        erro = response.match(FRETE_PARAMS[@@servico_padrao][:match][:erro])[1].to_i
        raise ArgumentError.new("#{response.match(FRETE_PARAMS[@@servico_padrao][:match][:erro_mensagem])[1]}") if erro != 0
      else
        erro = response.match(FRETE_PARAMS[@@servico_padrao][:match][:erro_mensagem])[1]
        raise "#{erro}" unless erro == 'OK'
      end
      
      response.match(FRETE_PARAMS[@@servico_padrao][:match][tipo])[1].gsub(",", ".").to_f
    end
  end
  
  private 
    def self.setar_parametros_default(options)
      options[:de] = @@cep_origem_padrao if options[:de].nil?
      options[:para] = options[:para].gsub('-','')
      options[:peso] = 1 if options[:peso].nil?
      options[:comprimento] = 20 if options[:comprimento].nil?
      options[:largura] = 20 if options[:largura].nil?
      options[:altura] = 20 if options[:altura].nil?

      #Arredonda o peso para cima
      options[:peso] = options[:peso].ceil
      
      options
    end
  
end