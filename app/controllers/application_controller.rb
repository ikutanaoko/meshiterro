class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_peritted_parameters, if: :devise_controller?
  
    def after_sign_in_path_for(resource)
      post_images_path
    end
    def after_sign_out_path_for(resource)
      about_path
    end    
    
    
  protected
  
  def configure_peritted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
