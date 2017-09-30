class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found 


  def routing_error
    message = "The route you are looking for could not be found" 
    flash[:alert] = message
    redirect_to root_path
  end


protected
  def resource_not_found 
  end

end
