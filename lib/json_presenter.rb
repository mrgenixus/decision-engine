require 'json'
require 'presenter'

class JsonPresenter < Presenter
  def intialize (output_hash)
  	@output_hash = output_hash
  end
  def present(output_hash = @output_hash)
  	@output_hash.to_json
  end
end