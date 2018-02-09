module NavHelper
  BULMA_IS_ACTIVE = 'is-active'.freeze

  # Returns true iff current
  # controller and action is within given list of controller#action s.
  # If the given list contains entries without a '#' it kind of activates
  # all given actions.
  def nav_is_in? *active_routes
    active_routes.each do |route|
      controller,action = route.split('#')
      if controller == controller_name # (current_controller)
        if action.nil? || action == action_name # (current_action)
          return true
        end
      end
    end
    false
  end

  # Returns the css class for an active element if current
  # controller and action is within given list of controller#action s.
  # If the given list contains entries without a '#' it kind of activates
  # all given actions.
  def nav_class_if_active *active_routes
    nav_is_in?(*active_routes)? BULMA_IS_ACTIVE : ''
  end
end
