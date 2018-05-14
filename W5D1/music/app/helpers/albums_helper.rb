module AlbumsHelper
  def album_info
    "
    </select>
    <label> Album Title
      <input type=\"text\" name=\"album[title]\" value=\"#{h(@album.title)}\">
    </label>
    <label> Date Released
      <input type=\"date\" name=\"album[date]\" value=\"#{h(@album.year)}\">
    </label>
    <label> Live
      <input type=\"radio\" name=\"album[state]\" value=\"True\">
    </label>
    <label> Studio
      <input type=\"radio\" name=\"album[state]\" value=\"False\">
    </label>
    ".html_safe
  end
end
