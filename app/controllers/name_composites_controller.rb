class NameCompositesController < ApplicationController
  # GET /name_composites
  # GET /name_composites.xml
  def index
    @name_composites = NameComposite.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @name_composites }
    end
  end

  # GET /name_composites/1
  # GET /name_composites/1.xml
  def show
    @name_composite = NameComposite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @name_composite }
    end
  end

  # GET /name_composites/new
  # GET /name_composites/new.xml
  def new
    @name_composite = NameComposite.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @name_composite }
    end
  end

  # GET /name_composites/1/edit
  def edit
    @name_composite = NameComposite.find(params[:id])
  end

  # POST /name_composites
  # POST /name_composites.xml
  def create
    @name_composite = NameComposite.new(params[:name_composite])

    respond_to do |format|
      if @name_composite.save
        flash[:notice] = 'NameComposite was successfully created.'
        format.html { redirect_to(@name_composite) }
        format.xml  { render :xml => @name_composite, :status => :created, :location => @name_composite }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @name_composite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /name_composites/1
  # PUT /name_composites/1.xml
  def update
    @name_composite = NameComposite.find(params[:id])

    respond_to do |format|
      if @name_composite.update_attributes(params[:name_composite])
        flash[:notice] = 'NameComposite was successfully updated.'
        format.html { redirect_to(@name_composite) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @name_composite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /name_composites/1
  # DELETE /name_composites/1.xml
  def destroy
    @name_composite = NameComposite.find(params[:id])
    @name_composite.destroy

    respond_to do |format|
      format.html { redirect_to(name_composites_url) }
      format.xml  { head :ok }
    end
  end
end
