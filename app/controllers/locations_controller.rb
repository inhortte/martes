class LocationsController < ApplicationController
  before_filter :fetch_location, :only => [:show, :edit,
                                           :update, :destroy,
                                           :remove_keeper, :remove_mustelid]
  
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
        begin
          params[:keepers].each { |k_id|
            @location.add_keeper(Keeper.find(k_id))
          }
        rescue NoMethodException
        end
        begin
          params[:mustelids].each { |m_id|
            @location.add_mustelid(Mustelid.find(m_id))
          }
        rescue NoMethodException
        end
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
        begin
          params[:keepers].each { |k_id|
            @location.add_keeper(Keeper.find(k_id))
          }
        rescue NoMethodError
        end
        begin
          params[:mustelids].each { |m_id|
            @location.add_mustelid(Mustelid.find(m_id))
          }
        rescue NoMethodError
        end
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

  def remove_keeper
    @location.remove_keeper(Keeper.find(params[:k_id]))
    redirect_to edit_location_path(@location)
  end

  def remove_mustelid
    @location.remove_mustelid(Mustelid.find(params[:m_id]))
    redirect_to edit_location_path(@location)
  end

  private
  
  def fetch_location
    @location = Location.find(params[:id])
  end
end
