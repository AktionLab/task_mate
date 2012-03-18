module IconHelper
  def icon(type, size = nil)
    image_tag "icons/#{type}.png", :class => "icon #{size}", :alt => type.to_s.titlecase, :title => type.to_s.titlecase
  end
end
