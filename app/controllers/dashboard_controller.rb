class DashboardController < ApplicationController

	def index
		@time = Time.now
		# wird im views/dashboard index.html.erb mit <%= @time -%> aufgerufen
    end

end
