module ApplicationHelper
  def auth_token(fat)
  "<input
    type=\"hidden\"
    name=\"authenticity_token\"
    value='<%= #{h(fat)} %>'>".html_safe
  end
end
