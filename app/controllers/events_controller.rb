class EventsController < ApplicationController
  def free
    @events = EventDate.joins(:event).order("start_at ASC")
    @events = @events.where("price_member = 0 AND price_other = 0")
    @events = @events.where("start_at > '#{6.hours.ago}'")
    @festival_events = @events.where("all_festival = 1")
    @events = @events.where("all_festival = 0 OR all_festival IS NULL")
    render 'index'
  end

  def index

    # Gets all eventdates and sorts them based on date and weight
    @events = EventDate.joins(:event).order("start_at ASC, events.weight DESC")

    if not (current_user && current_user.admin?)
      @events = @events.where("publish_at < '#{Time.now}'")
    end

    @events = @events.where("start_at > '#{6.hours.ago}'")
    @festival_events = @events.where("all_festival = 1")
    @events = @events.where("all_festival IS NULL OR all_festival = 0")

    if params.has_key?(:eventtype)
      @events = @events.joins(:event => :event_type).where('event_types.name = ?', params['eventtype'].tr('_', ' '))
      @festival_events = @festival_events.joins(:event => :event_type).where('event_types.name = ?', params['eventtype'].tr('_', ' '))

    end

    respond_to do |format|
      format.html
      format.json { render :json => @events.to_json( { :include =>  :event }) }
    end

  end

  def show
    @datetime = EventDate.find(params[:id])
    @event = @datetime.event

    if not @event.publish_at <= Time.now || (current_user && current_user.admin?)
      redirect_to root_url
    end
  end

  def speakers
    @speakers = Speaker.joins(:event => :event_dates).order("event_dates.start_at ASC")
  end

  private

  def event_date_params
    params.require(:event_date).permit(:start_at, :end_at, :sold_out, :url, :event_id)
  end

  def event_place_params
    params.require(:event_place).permit(:latitude, :longitude, :name)
  end

  def speaker_params
    params.require(:speakers).permit(:box_height, :description, :embed, :name, :event_id)
  end
end
