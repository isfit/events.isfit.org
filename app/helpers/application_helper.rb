module ApplicationHelper
	def format(str)
	  bc = BlueCloth.new(str) 
	  text = bc.to_html
	  return text.html_safe
	end
	def language_text
		I18n.locale.to_s.eql?("no") ? "English" : "Norsk" 
	end
	def language_link
		I18n.locale.to_s.eql?("no") ? "?locale=en" : "?locale=no"
	end
end
