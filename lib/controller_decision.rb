class ControllerDecision < Decision
	def self.find(controller_name)
		@object_context = "Controller"
		super(controller_name)
	end
	def initialize(controller_name,action)
		super(controller_name,action)
		@object_context = "Controller"
	end
	def controller
		self.class.find(@object_name)
	end
end