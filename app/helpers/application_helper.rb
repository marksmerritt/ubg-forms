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

  def display_avatar(user, size=40)
    if current_user.present?
      if user.avatar.attached?
        user.avatar.variant(resize: "#{size}x#{size}!")
      else
        gravatar_image_url(user.email, size: size)
      end
    end
  end

  def logo_helper(user, style)
    current_logo = "#{user.company.initials.downcase}-logo.jpg"
    image_tag(current_logo, class: style)
  end
end
