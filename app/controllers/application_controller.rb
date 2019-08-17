class ApplicationController < ActionController::Base
  rescue_from StandardError do |exception|
    render :file => 'public/500.html'
  end
end
