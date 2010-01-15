class LocationsController < ApplicationController
  def index
    @locations = Location.find(:all)

    respond_to { |f|
      f.html
      f.xml { render :xml => @locations.to_xml }
    }
  end

  def new
  end

  def show
  end

  def edit
  end

end
