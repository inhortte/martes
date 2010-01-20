class KeepersController < ApplicationController
  before_filter :fetch_keeper, :only => [:show, :edit, 
                                         :update, :destroy,
                                         :remove_location]

  def index
    @keepers = Keeper.find(:all)
  end

  def new
    @keeper = Keeper.new
  end

  def create
    @keeper = Keeper.new(params[:keeper])
    respond_to { |format|
      if @keeper.save
        flash[:notice] = 'The keeper has been saved.'
        format.html { redirect_to keepers_url }
        format.xml { render :xml => @keeper, :status => created,
          :keeper => keeper_url(@keeper) }
      else
        flash[:notice] = 'Some error occured. It is probably your fault.'
        format.html { redirect_to :action => :new }
        format.xml { render :xml => @keeper.errors,
          :status => :unprocessable_entity }
      end
    }
  end

  def show
  end

  def edit
  end

  def update
    respond_to { |format|
      if @keeper.update_attributes(params[:keeper])
        params[:locations].each { |loc_id|
          @keeper.add_location(Location.find(loc_id))
        }
        flash[:notice] = 'The keeper has been updated.'
        format.html { redirect_to keepers_url }
        format.xml { render :xml => @keeper, :status => created,
          :keeper => keeper_url(@keeper) }
      else
        flash[:notice] = 'Some error occured. It is probably your fault.'
        format.html { redirect_to :action => :new }
        format.xml { render :xml => @keeper.errors,
          :status => :unprocessable_entity }
      end
    }
  end

  def destroy
    @keeper.destroy
    respond_to { |f|
      f.html { redirect_to keepers_url }
      f.xml { head :ok }
    }
  end

  def remove_location
    logger.debug('... entering remove_location')
    logger.debug('... location id: ' + params[:loc_id])
    @keeper.remove_location(Location.find(params[:loc_id]))
    redirect_to edit_keeper_path(@keeper)
  end

  private

  def fetch_keeper
    @keeper = Keeper.find(params[:id])
  end
end
