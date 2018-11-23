# frozen_string_literal: true

ActionView::Base.field_error_proc = proc do |html_tag, _instance|
  if /<(input|label|textarea|select)/.match?(html_tag)
    html_field = Nokogiri::HTML::DocumentFragment.parse(html_tag)
    html_field.children.add_class "is-danger"
    html_field.to_s.html_safe
  else
    html_tag.html_safe
  end
end
