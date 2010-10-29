class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
    def ip_scoped
      # filial = IpFilial.new(request.ip).filial
      if filial_selecionada == 0
        request.session[:filial].nil? ? Cec : Cec.where(:filial => request.session[:filial])
      else
        Cec.where(:filial => filial_selecionada)
      end
    end
    
    def filial_selecionada
      IpFilial.new(request.ip).filial != 0 ? IpFilial.new(request.ip).filial : request.session[:filial]
    end
end
