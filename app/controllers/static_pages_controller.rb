class StaticPagesController < ApplicationController
  def impressum
  	session[:previous_url] = URI(request.referer).path
  end
end
