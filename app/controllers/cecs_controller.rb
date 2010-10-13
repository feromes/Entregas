class CecsController < ApplicationController
  # GET /cecs
  # GET /cecs.xml
  def index
    if params[:data] != nil
      @cecs = Cec.all(:conditions => ["data_da_entrega = ?", params[:data]])
    elsif params[:numero_do_pedido] != nil
      @cecs = Cec.all(:conditions => ["numero_do_pedido like ?", "%" + params[:numero_do_pedido] + "%"])
    else
      @cecs = Cec.all(:conditions => ["data_da_entrega > ?", Date.today], :order => "data_da_entrega, cep")
    end
    
    respond_to do |format|
      if !params[:id].nil? and Cec.exists?(params[:id])
        @cec = Cec.find(params[:id])
        format.html { redirect_to @cec } 
      else
        format.html # index.html.erb
        format.xml  { render :xml => @cecs }
      end
    end
  end

  # GET /cecs/1
  # GET /cecs/1.xml
  def show
    @cec = Cec.find(params[:id])
    @map = @cec.map
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cec }
    end
  end

  # GET /cecs/new
  # GET /cecs/new.xml
  def new
    @cec = Cec.new(:cep => params[:cep], :numero => nil)
    @cec.save
    @cec.errors.clear

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cec }
    end
  end

  # GET /cecs/1/edit
  def edit
    @cec = Cec.find(params[:id])
  end

  # POST /cecs
  # POST /cecs.xml
  def create
    @cec = Cec.new(params[:cec])

    respond_to do |format|
      if @cec.save
        format.html { redirect_to(@cec, :notice => 'Cec was successfully created.') }
        format.xml  { render :xml => @cec, :status => :created, :location => @cec }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cec.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cecs/1
  # PUT /cecs/1.xml
  def update
    @cec = Cec.find(params[:id])

    respond_to do |format|
      if @cec.update_attributes(params[:cec])
        format.html { redirect_to(@cec, :notice => 'Cec was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cec.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cecs/1
  # DELETE /cecs/1.xml
  def destroy
    @cec = Cec.find(params[:id])
    @cec.destroy

    respond_to do |format|
      format.html { redirect_to(cecs_url) }
      format.xml  { head :ok }
    end
  end
end
