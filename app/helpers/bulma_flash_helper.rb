module BulmaFlashHelper
  def bulma_flash_class
    {
      # Not used: is-primary
      'success' => 'is-success',
      'error'   => 'is-danger',
      'info'    => 'is-info',
      'alert'   => 'is-warning',
      'warning' => 'is-warning'
    }.freeze
  end
end
