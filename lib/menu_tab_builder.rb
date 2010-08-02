class MenuTabBuilder < TabsOnRails::Tabs::Builder
  def tab_for(tab, name, options, item_options = {})
    item_options[:class] = (current_tab?(tab) ? 'active' : 'inactive')
    @context.content_tag(:li) do
      @context.link_to(name, options,item_options)
    end
  end
  # the following is necessary to make this rails3 compatible
  def open_tabs(options = {})
    @context.tag("ul", options, open = true)
  end

  # the following is necessary to make this rails3 compatible
  def close_tabs(options = {})
    "</ul>".html_safe
  end
end