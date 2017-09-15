module ApplicationHelper
  def error_messages(object, message=nil) 
    html = "" 
    unless object.errors.blank? 
      html << "<div class='errorExplanation' id = 'errorExplanation'>\n" 
      if message.blank? 
        if object.new_record? 
          html << "\t\t<h2>#{object.errors.count} errors prevented this #{object.class.name.humanize.downcase} from being saved </h2>\n" 
        else 
          html << "\t\t<h2>#{object.errors.count} errors prevented this #{object.class.name.humanize.downcase} from being saved</h2>\n" 
        end 
      else 
        html << "<h5>#{message}</h5>" 
      end 
      html << "\t\t<ul>\n" 
      object.errors.full_messages.each do |error| 
        html << "\t\t\t<li>#{error}</li>\n" 
      end 
      html << "\t\t</ul>\n" 
      html << "\t</div>\n" 
    end 
    html 
  end
end
