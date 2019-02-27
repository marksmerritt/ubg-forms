module ApplicationHelper
  def display_icon(svg_name, style_class = "")
    path = asset_path('sprite.svg') 
    svg_name = svg_name.prepend("#icon-")
    
    content_tag(:svg, class: style_class) do 
      content_tag(:use, nil, 'xlink:href' => path + svg_name)
    end
  end

  def form_submit_text(obj)
    obj.new_record? ? "Create" : "Update"
  end

  def active_link?(path, style)
    current_page?(path) ? style : ""
  end
end
