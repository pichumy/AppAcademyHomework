module ApplicationHelper
  def login_inputs
    "<label> Email:
      <input type=\"text\" name=\"user[email]\"/>
    </label>
    <label> Password:
      <input type=\"password\" name=\"user[password]\"/>
    </label>
    ".html_safe
  end

  def auth_token
    "<input name=\"authenticity_token\" type=\"hidden\"
    value=\"#{h(form_authenticity_token)}\"/>".html_safe
  end
end
