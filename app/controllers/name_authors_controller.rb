class NameAuthorsController < ApplicationController
  # GET /name_authors
  # GET /name_authors.xml
  def index
    @name_authors = NameAuthor.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @name_authors }
    end
  end

  # GET /name_authors/1
  # GET /name_authors/1.xml
  def show
    @name_author = NameAuthor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @name_author }
    end
  end

  # GET /name_authors/new
  # GET /name_authors/new.xml
  def new
    @name_author = NameAuthor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @name_author }
    end
  end

  # GET /name_authors/1/edit
  def edit
    @name_author = NameAuthor.find(params[:id])
  end

  # POST /name_authors
  # POST /name_authors.xml
  def create
    @name_author = NameAuthor.new(params[:name_author])

    respond_to do |format|
      if @name_author.save
        flash[:notice] = 'NameAuthor was successfully created.'
        format.html { redirect_to(@name_author) }
        format.xml  { render :xml => @name_author, :status => :created, :location => @name_author }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @name_author.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /name_authors/1
  # PUT /name_authors/1.xml
  def update
    @name_author = NameAuthor.find(params[:id])

    respond_to do |format|
      if @name_author.update_attributes(params[:name_author])
        flash[:notice] = 'NameAuthor was successfully updated.'
        format.html { redirect_to(@name_author) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @name_author.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /name_authors/1
  # DELETE /name_authors/1.xml
  def destroy
    @name_author = NameAuthor.find(params[:id])
    @name_author.destroy

    respond_to do |format|
      format.html { redirect_to(name_authors_url) }
      format.xml  { head :ok }
    end
  end
end
