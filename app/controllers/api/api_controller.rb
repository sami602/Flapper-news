module Api
  class ApiController < ApplicationController

    skip_before_filter :verify_authenticity_token
    respond_to :json

    before_action :configure_permitted_parameters, if: :devise_controller?



    private
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :username
    end
  end
end