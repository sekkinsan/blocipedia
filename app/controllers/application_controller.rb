class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #redirect user to login page if they're not signed in
  before_action :authenticate_user!
end
