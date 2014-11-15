class Admin::EventPlacesController < ApplicationController
  layout 'admin'
  def new
    @event_place = EventPlace.new
  end

  def create
    @event_place = EventPlace.new(event_place_params)

    if @event_place.save
      redirect_to admin_event_places_path
    else
      render action: "new"
    end
  end

  def edit
    @event_place = EventPlace.find(params[:id])
  end

  def update
    @event_place = EventPlace.find(params[:id])
    @event_place.update_attributes(event_place_params)

    if @event_place.save
      redirect_to admin_event_places_path
    else
      render action: "edit"
    end

  end

  def index
    @event_places = EventPlace.all
  end

  private 
  def event_place_params
    params.require(:event_place).permit(:id, :name, :longitude, :latitude, :created_at, :updated_at)
  end
end
