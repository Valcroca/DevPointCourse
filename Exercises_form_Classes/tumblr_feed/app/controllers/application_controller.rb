class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private
    def tumblr_client
      @tumblr_client ||= Tumblr::Client.new(client: :httpclient)
    end

end
