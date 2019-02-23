module ApplicationHelper
  def display_icon(svg_name, style_class = "")
    path = asset_path('sprite.svg') 
    svg_name = svg_name.prepend("#icon-")
    
    content_tag(:svg, class: style_class) do 
      content_tag(:use, nil, 'xlink:href' => path + svg_name)
    end
  end

  def form_submit_text(obj)
    if obj.new_record?
      "Create"
    else
      "Update"
    end
  end
end
