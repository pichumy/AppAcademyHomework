module BandsHelper
  def band_info
    "<label> Band Name
      <input type = \"text\" name=\"band[name]\" value=\"#{@band.name}\">
    </label>".html_safe
  end
end
