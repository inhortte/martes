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
