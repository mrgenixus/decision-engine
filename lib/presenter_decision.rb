class PresenterDecision < Decision
	def self.find(presenter_name)
		puts "Controller to find: #{presenter_name}"
		@object_context = "Presenter"
		super(presenter_name)
	end
	def initialize (presenter_name,action)
		super(presenter_name,action)
		@object_context = "Presenter"
	end
	def presenter
		self.class.find(@object_name)
		
	end
end