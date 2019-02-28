module MarkdownTemplateHandler
  def self.call(template)
    compiled_source = erb.call(template)
    "Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                             no_intra_emphasis: true,
                             fenced_code_blocks: true,
                             space_after_headers: true,
                             prettify:                     true,
                             tables:                       true,
                             with_toc_data:                true,
                             autolink: true).render(begin;#{compiled_source};end).html_safe"
  end
end
