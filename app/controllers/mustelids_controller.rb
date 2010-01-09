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
end
