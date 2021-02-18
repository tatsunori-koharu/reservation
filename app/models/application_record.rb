class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.parmit(:sign_in_up, keys: [:name])
  end
end
