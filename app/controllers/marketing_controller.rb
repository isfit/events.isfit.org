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
    if I18n.locale.to_s.eql?("no")
      @events = @events.where("body_no IS NOT NULL AND title_no IS NOT NULL AND body_no > '' AND title_no > ''").limit(5)
      @festival_events = @events.where("body_no IS NOT NULL OR title_no IS NOT NULL AND body_no > '' AND title_no > '' ")
    elsif I18n.locale.to_s.eql?("en")
      @events = @events.where("body_en IS NOT NULL AND title_en IS NOT NULL AND body_en > '' AND title_en > ''").limit(5)
      @festival_events = @events.where("body_en IS NOT NULL OR title_en IS NOT NULL AND body_en > '' AND title_en > '' ")
    end
  end
end
