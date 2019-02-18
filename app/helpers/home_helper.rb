module HomeHelper
  def display_svg(name)
    File.open("app/assets/images/#{name}", "rb") do |file|
      raw(file.read)
    end
  end

  def maps_iframe1
    %Q{<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3109.1180302577272!2d-77.16184268481285!3d38.80684875988192!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89b7b2efe9af6581%3A0xfc6ca20003fd6094!2s5250+Cherokee+Ave%2C+Alexandria%2C+VA+22312!5e0!3m2!1sen!2sus!4v1550466168109" width="200" height="200" frameborder="0" style="border:0" allowfullscreen></iframe>}.html_safe
  end

  def maps_iframe2
    %Q{<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3110.6899248640143!2d-77.44006948465959!3d38.77081536200065!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89b65b0f328fc113%3A0x3e98b29e5466b48!2s9204+Venture+Ct%2C+Manassas+Park%2C+VA+20111!5e0!3m2!1sen!2sus!4v1550472620146" width="200" height="200" frameborder="0" style="border:0" allowfullscreen></iframe>}.html_safe
  end
end
