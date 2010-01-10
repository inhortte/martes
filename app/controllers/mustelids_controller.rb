class MustelidsController < ApplicationController

  # GET /mustelids
  # GET /mustelids.xml
  def index
    options = { :order => 'created_at desc', :per_page => 10 }
#    @mustelid_pages, @mustelids = paginate :mustelids, options
    @mustelids = Mustelid.find(:all)

    respond_to { |format|
      format.html
      format.xml {
        render :xml => @mustelids.to_xml
      }
    }
  end

  # GET /mustelids/new
  def new
    @mustelid = Mustelid.new
    @subfamilies = Subfamily.find(:all)
  end

  # POST /mustelids
  # POST /mustelids.xml
  def create
    @mustelid = Mustelid.new(params[:mustelid])

    respond_to { |format|
      if @mustelid.save
        flash[:notice] = 'The mustelid has been saved.'
        format.html {
#          redirect_to(@mustelid) -- this goes to /mustelids/:id
          redirect_to mustelids_url
        }
        format.xml {
          render :xml => @mustelid, status => :created,
#                 :location => @mustelid
                 :location => mustelid_url(@mustelid)
        }
      else
        flash[:notice] = 'Some error occurred.'
        format.html {
          redirect_to :action => :new
        }
        format.xml {
          render :xml => @mustelid.errors, :status => :unprocessable_entity
        }
      end
    }
  end

  def show
    redirect_to mustelids_path
  end

  def edit
    @mustelid = Mustelid.find(params[:id])
    @subfamilies = Subfamily.find(:all)
  end

  def update
    @mustelid = Mustelid.find(params[:id])

    respond_to { |format|
      if @mustelid.update_attributes(params[:mustelid])
        flash[:notice] = 'The mustelid has been updated.'
        format.html {
          redirect_to mustelids_url
        }
        format.xml {
          render :xml => @mustelid, status => :created,
                 :location => mustelid_url(@mustelid)
        }
      else
        flash[:notice] = 'Some error occurred.'
        format.html {
          redirect_to :action => :edit, :id => @mustelid
        }
        format.xml {
          render :xml => @mustelid.errors, :status => :unprocessable_entity
        }
      end
    }
  end

  def destroy
    @mustelid = Mustelid.find(params[:id])
    @mustelid.destroy
    respond_to do |format|
      format.html { redirect_to(mustelids_url) }
      format.xml { head :ok }
    end
  end 

  def subfamily_change
    sf = params[:thurk].to_i
    render :update do |p|
      p.replace_html "genusp", :partial => "genus", :locals => { :sf => sf }
    end
  end

  def genus_change
    g = params[:thurk].to_i
    render :update do |p|
      p.replace_html "speciesp", :partial => "species", :locals => { :g => g }
    end
  end
end
