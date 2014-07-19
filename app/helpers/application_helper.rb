module ApplicationHelper

  def get_color(time)
    return "background-color: rgba(0,0,0,0)" if time.nil?
    hours_since_last_action = ((Time.now.utc - time.utc) / 1.hour).round * 5
    if hours_since_last_action > 255
      green = 0
      red = 255
    else
      green = 255 - hours_since_last_action
      red = hours_since_last_action
    end
    return "background-color: rgba(#{red},#{green},0,0.6)"
  end

end
