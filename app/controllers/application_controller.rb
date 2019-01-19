class ApplicationController < ActionController::API

  # protect_from_forgery with: :exception
  # rescue_from Exception, with: :handle500

  config.generators do |g|
    g.test_framework :rspec,
    fixtures: false,
    view_specs: false,
    heloper_specs: false,
    routing_specs: false
  end


  def check_auth
    @user = User.find_by(auth_token: params[:auth_token])

    if @user == nil
      render status: 401, json: { error: "認証エラーです" }
    end
  end
end
