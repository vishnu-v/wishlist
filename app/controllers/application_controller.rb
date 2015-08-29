# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :load_site
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  layout 'basic'

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
 
  def load_site
  	subdomains = request.subdomains
  	if subdomains.first
  		@site = Site.find_by_name(subdomains.first)
  	else
  		@site = Site.find_by_name "root"
  	end
  end
end
