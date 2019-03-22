class SightingsController < ApplicationController
    def index
        @animal = Animal.all
        @sighting= Sighting.all
    end
    
    def show 
         if Sighting.exists?
         @sightings = Sighting.find(params[:id])
        end
    end 
    
    def new
        @sighting = Sighting.new
    end
    
    def create
       @sighting = Sighting.new(sighting_params)
        if @sighting.save
            redirect_to sightings_path
        else 
            render action: :new
        end
    end
    
    def update
        @sighting = Sighting.find(params[:id])
        if @sighting.update_attributes(sighting_params)
           flash[:notice]= 'Sighting updated'
           redirect_to sighting_path
        else
            render action: :edit
        end
    end
    
    def edit
        @sighting= Sighting.new
    end
    
    def destroy
        @sighting= Sighting.find(params[:id])
        @sighting.destroy
        redirect_to animals_path
    end
    private
    
    def sighting_params
        params.require(:sighting).permit(:time, :date, :latitude, :longitude)
    end
end
