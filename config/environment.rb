# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# No field_with_error wrapping of form text fields with validation errrors.
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end
