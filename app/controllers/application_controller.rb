class ApplicationController < ActionController::API
  # protect_from_forgery with: :exception
  rescue_from Exception, with: :handle500


  def handle500
    render status: 500
  end
end
