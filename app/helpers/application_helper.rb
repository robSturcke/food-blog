module ApplicationHelper
  def markdown(text)
    Redcarpet.new(text, :hard_wrap, :filter_html, :autolink, :no_intraemphasis).to_html.html_safe
  end
end
