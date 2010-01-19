class KeepersController < ApplicationController
  before_filter :fetch_keeper, :only => [:edit, :update, :destroy]

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

  def edit
  end

  def update
    respond_to { |format|
      if @keeper.update_attributes(params[:keeper])
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

  private

  def fetch_keeper
    @keeper = Keeper.find(params[:id])
  end
end
