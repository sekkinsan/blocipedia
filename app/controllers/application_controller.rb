class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  #redirect user to login page if they're not signed in
  before_action :authenticate_user!
end
