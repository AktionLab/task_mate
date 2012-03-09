module IconHelper
  def icon(type, size = nil)
    image_tag "icons/#{type}.png", :class => "icon #{size}"
  end
end
