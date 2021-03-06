class MustelidsController < ApplicationController
  layout "application.haml"

  before_filter :fetch_subfamilies, :only => [:new, :edit]
  before_filter :fetch_mustelid, :only => [:show, :edit, :update, :destroy]

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

  def new
    @mustelid = Mustelid.new
    @mustelid.detaloj = Detaloj.new
  end

  def create
    @mustelid = Mustelid.new(params[:mustelid])

    respond_to { |format|
      if @mustelid.save
        @mustelid.add_location(params[:location] == 0 ?
                               nil :
                               Location.find(params[:location]))
        flash[:notice] = 'The mustelid has been saved.'
        format.html {
          redirect_to mustelids_url
        }
        format.xml {
          render :xml => @mustelid, :status => :created,
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
  end

  def edit
  end

  def update
    respond_to { |format|
      if @mustelid.update_attributes(params[:mustelid])
        @mustelid.add_location(params[:location] == 0 ?
                               nil :
                               Location.find(params[:location]))
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
    @mustelid.destroy
    respond_to do |format|
      format.html { redirect_to(mustelids_url) }
      format.xml { head :ok }
    end
  end 

  def subfamily_change
    sf = params[:thurk].to_i
    render :update do |p|
      p.replace_html "genusp", :partial => "genus", :locals => { :sf => sf, :selected => nil }
    end
  end

  def genus_change
    g = params[:thurk].to_i
    render :update do |p|
      p.replace_html "speciesp", :partial => "species", :locals => { :g => g, :selected => nil }
    end
  end

  private

  def fetch_subfamilies
    @subfamilies = Subfamily.find(:all)
    @mustelinae = @subfamilies[-1]
  end

  def fetch_mustelid
    @mustelid = Mustelid.find(params[:id])
  end
end
