class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate

  # Converts errors to array
  def errors_to_array(errors_hash)
    errors = []
    errors_hash.each do |error|
      errors << error[0].to_s.titleize + " " + error[1]
    end
    errors
  end

  protected
  def authenticate
    if params[:auth] && params[:auth][:username] == APP_AUTH[:username] && params[:auth][:password] == APP_AUTH[:password]
      true
    else
      head :unauthorized
      false
    end
  end
end