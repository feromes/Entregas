class EntregadorsController < ApplicationController
  # GET /entregadors
  # GET /entregadors.xml
  def index
    @entregadors = ip_scoped.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entregadors }
    end
  end

  # GET /entregadors/1
  # GET /entregadors/1.xml
  def show
    @entregador = Entregador.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entregador }
    end
  end

  # GET /entregadors/new
  # GET /entregadors/new.xml
  def new
    @entregador = Entregador.new
    @entregador.ativo = true

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entregador }
    end
  end

  # GET /entregadors/1/edit
  def edit
    @entregador = Entregador.find(params[:id])
  end

  # POST /entregadors
  # POST /entregadors.xml
  def create
    @entregador = Entregador.new(params[:entregador])
    @entregador.filial = filial_selecionada
    
    respond_to do |format|
      if @entregador.save
        format.html { redirect_to(@entregador, :notice => 'Entregador was successfully created.') }
        format.xml  { render :xml => @entregador, :status => :created, :location => @entregador }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entregador.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entregadors/1
  # PUT /entregadors/1.xml
  def update
    @entregador = Entregador.find(params[:id])

    respond_to do |format|
      if @entregador.update_attributes(params[:entregador])
        format.html { redirect_to(@entregador, :notice => 'Entregador was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entregador.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  private
  
    def ip_scoped
      # filial = IpFilial.new(request.ip).filial
      if filial_selecionada == 0
        request.session[:filial].nil? ? Entregador : Entregador.where(:filial => request.session[:filial])
      else
        Entregador.where(:filial => filial_selecionada)
      end
    end

  # DELETE /entregadors/1
  # DELETE /entregadors/1.xml
  # def destroy
  #   @entregador = Entregador.find(params[:id])
  #   @entregador.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to(entregadors_url) }
  #     format.xml  { head :ok }
  #   end
  # end
end
