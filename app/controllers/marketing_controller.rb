class MarketingController < ApplicationController
  def poster
  	    # Gets all eventdates and sorts them based on date and weight
    @events = EventDate.joins(:event).order("events.weight DESC")
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
  end
end
