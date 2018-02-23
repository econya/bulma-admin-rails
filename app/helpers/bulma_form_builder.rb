class BulmaFormBuilder < ActionView::Helpers::FormBuilder
  delegate :content_tag, :tag, to: :@template

  #   <div class="field-label is-normal"> ...(label class="label")... </div>
  def bulma_label attr_name
    div_with_class('field-label is-normal') { label(attr_name, class: 'label') }
  end

  # Icon to be used within an input field.
  # icon_name should be a fontawesome icon name like "fa-left".
  #   <span class="icon is-small is-left"><i class="fa #{icon_name}"/></span>
  def span_icon icon_name
    return '' if !icon_name

    content_tag :span, class: 'icon is-small is-left' do
      content_tag :i, '', class: ['fa', icon_name]
    end
  end

  # true iff (validation) error on attribute found
  def has_errors? attr_name
    object.errors[attr_name].any?
  end

  # iff has errors:
  #   <p class="help is-danger">error1<br/>error2</p>
  def errors_on attr_name
    if has_errors?(attr_name)
      content_tag :p, class: 'help is-danger' do
        object.errors[attr_name].join("<br/>")
      end
    end
  end

  #  <p class="help">#{help_text}</p>
  def help help_text
    return '' if !help_text

    content_tag :p, help_text, class: 'help'
  end

  def errors
    if object.errors.any?
      content_tag :div, class: 'block' do
        content_tag :div, class: 'notification is-danger' do
          heading = content_tag :h2 do
            "#{@template.pluralize(object.errors.count, 'error')} prohibited this #{object.class} from being saved:"
          end
          ul = content_tag :ul do
            object.errors.full_messages.collect do |err|
              @template.concat(content_tag(:li, err))
            end
          end
          heading + ul
        end
      end
    end
  end

  # yields classes (string) for the input field.
  # Roughly creating this
  # .field.is-horizontal
  #   .field-label
  #     ... label ...
  #   .field-body
  #     .field.is-expanded
  #       %p.contro.has-icons-left
  #         = yield
  #         %span
  #           %i
  #       %p.help.is-danger
  #       %p.help
  def horizontal_field_wrap attr_name, icon: nil, help_text: nil
    content_tag :div, class: 'field is-horizontal' do
      label_html = bulma_label attr_name
      field_body_html = content_tag :div, class: 'field-body' do
        field = content_tag :div, class: 'field is-expanded' do
          control_classes = ['control']
          control_classes << 'is-expanded'    if (help_text || icon)
          control_classes << 'has-icons-left' if icon
          control_classes << 'is-danger'      if has_errors?(attr_name)
          control_paragraph = content_tag :p, class: control_classes do
            icon_span = span_icon icon
            (yield control_classes.join(' ') if block_given?) + icon_span
          end
          control_paragraph + errors_on(attr_name) + help(help_text)
        end
      end

      label_html + field_body_html
    end
  end

  def labeled_text_field attr_name, icon: nil, placeholder: nil, help_text: nil
    horizontal_field_wrap(attr_name,
                          icon: icon,
                          help_text: help_text) do |classes|
      text_field(attr_name, class: "input #{classes}",
                 placeholder: placeholder)
    end
  end

  def labeled_password_field attr_name, icon: nil, placeholder: nil, help_text: nil
    horizontal_field_wrap(attr_name,
                          icon: icon,
                          help_text: help_text) do |classes|
      password_field(attr_name, class: "input #{classes}",
                     placeholder: placeholder)
    end
  end

  def labeled_datetime_select attr_name, help_text: nil
    horizontal_field_wrap(attr_name,
                          help_text: help_text) do |classes|
      date_time_selector = ActionView::Helpers::DateTimeSelector.new(Time.current,
                                                                     { prefix: object.model_name.param_key,
                                                                       field_name: attr_name.to_s,
                                                                       include_position: true})
      @template.concat(div_with_class("select") { date_time_selector.select_year })
      @template.concat(" ")
      @template.concat(div_with_class("select") { date_time_selector.select_month })
      @template.concat(" ")
      @template.concat(div_with_class("select") { date_time_selector.select_day })
      @template.concat(" ")
      @template.concat(div_with_class("select") { date_time_selector.select_hour })
      @template.concat(content_tag :span, " : ")
      @template.concat(div_with_class("select") { date_time_selector.select_minute })
    end
  end

  private

  def div_with_class classes
    content_tag :div, class: classes do
      yield if block_given?
    end
  end
end

