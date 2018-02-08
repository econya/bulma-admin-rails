module NavHelper
  BULMA_IS_ACTIVE = 'is-active'.freeze

  # Returns the css class for an active element if current
  # controller and action is within given list of controller#action s.
  # If the given list contains entries without a '#' it kind of activates
  # all given actions.
  def nav_class_if_active *active_routes
    current_controller,current_action = params[:controller], params[:action]
    active_routes.each do |route|
      controller,action = route.split('#')
      if controller == current_controller
        if action.nil? || action == current_action
          return BULMA_IS_ACTIVE
        end
      end
    end
    ''
  end
end
