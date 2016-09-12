module ApplicationHelper
  def markdown(text)
    # choose a rednerer and pass the options (renderer is either Render::XML or Render::HTML)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true, autolink: true, no_intraemphasis: true)
    # create a new instance of markdown and pass the renderer
    md = Redcarpet::Markdown.new(renderer)
    # use the instance to render the text
    md.render(text).html_safe
  end
end
