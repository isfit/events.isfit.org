class EventType < ActiveRecord::Base
  def name
    I18n.locale.to_s.eql?("no") ? self.name_no : self.name_en
  end
end
