class LocationsController < ApplicationController
  def index
    @locations = Location.find(:all)

    respond_to { |f|
      f.html
      f.xml { render :xml => @locations.to_xml }
    }
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(params[:location])
    respond_to { |format|
      if @location.save
        flash[:notice] = 'The location has been saved.'
        format.html { redirect_to locations_url }
        format.xml { render :xml => @location, :status => created,
          :location => location_url(@location) }
      else
        flash[:notice] = 'Some error occured. It is probably your fault.'
        format.html { redirect_to :action => :new }
        format.xml { render :xml => @location.errors,
          :status => :unprocessable_entity }
      end
    }
  end

  def show
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    respond_to { |format|
      if @location.update_attributes(params[:location])
        flash[:notice] = 'The location has been updated.'
        format.html { redirect_to locations_url }
        format.xml { render :xml => @location, status => :created,
                            :location => location_url(@location) }
      else
        flash[:notice] = 'Some error occurred.'
        format.html { redirect_to :action => :edit, :id => @location }
        format.xml { render :xml => @location.errors, 
                            :status => :unprocessable_entity }
      end
    }
  end

  def destroy
    @location.destroy
    respond_to { |f|
      f.html { redirect_to locations_url }
      f.xml { head :ok }
    }
  end
end
