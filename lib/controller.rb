require 'controller_decision'
class Controller
	def new (controller_name)
		@instance = ControllerDecision.new(controller_name,:none)
	end
end