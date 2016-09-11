module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def title_html(html_data)
    content_for(:title_html) { html_data.html_safe }
  end

  def small_add_button(path, text='ADD')
    link_to text, path, class: 'btn btn-small btn-green'
  end

  def small_edit_button(path, text='EDIT')
    link_to text, path, class: 'btn btn-small btn-yellow'
  end

  def small_delete_button(path, text='DELETE')
    link_to text, path, class: 'btn btn-small btn-red', method: :delete, data: { confirm: 'Are you sure you want to delete this item?' }
  end


end
