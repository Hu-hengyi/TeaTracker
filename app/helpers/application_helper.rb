module ApplicationHelper

  def controller_stylesheet_link_tag
    stylesheet = "#{params[:controller]}.css"

    if File.exists?(File.join(Rails.public_path, 'stylesheets', stylesheet))
      stylesheet_link_tag stylesheet
    end
  end

  def hybridMap
    content_for(:head) do
      javascript_include_tag "http://beta.mapquestapi.com/sdk/leaflet/v0.1/mq-map.js?key=Fmjtd%7Cluubn161nl%2C2x%3Do5-90awg6"
    end
  end


end
