require 'presenter_decision'

class Presenter
	def new(presenter_name)
		@instance = PresenterDecision.new(presenter_name,:present)
	end
	def present (output_hash)
		puts "Presenter presented"
	end
end