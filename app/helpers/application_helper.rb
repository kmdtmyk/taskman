module ApplicationHelper

  require 'redcarpet'

  def markdown(text)
    render_options = {
      filter_html: true,
    }
    renderer = Redcarpet::Render::HTML.new(render_options)
    extensions = {
      autolink: true,
      tables: true,
    }
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text).html_safe
  end

end
