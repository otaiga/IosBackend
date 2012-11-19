class InfosController < ApplicationController
  before_filter :authenticate_api, :if => :json?
  before_filter :authenticate_user!

  def index
    @info = {:stuff => "loads of special info here"}
    respond_to do |format|
      format.json {render json: @info}
    end
  end

private

  def json?
    request.format.json? && !current_user
  end

  def authenticate_api
    authenticate_or_request_with_http_token do |token, options|
      if User.exists?(:authentication_token => token)
        params[:auth_token] = token
      end
    end
  end

end
