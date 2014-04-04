class DashboardController < ApplicationController

	def index
		@time = Time.now
		# wird im views /dashbiard index.html.erb mit <%= @time -%> aufgerufen
    end

end
