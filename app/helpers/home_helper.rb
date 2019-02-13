module HomeHelper
  def display_svg(name)
    File.open("app/assets/images/#{name}", "rb") do |file|
      raw(file.read)
    end
  end
end
