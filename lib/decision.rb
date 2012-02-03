class Decision
  
  
  def self.find(object_name)
    context = @object_context
    puts "Context: #{context}"
    # require "#{controller_name}_controller"
    object_whole_name = ("#{object_name}_#{context}").split('_').map {|w| w.capitalize}.join
    object_const_name = "#{object_whole_name}"
    puts "#{context} Name: #{object_const_name}"
    raise NameError.new "Constant not found: " unless Kernel.const_defined?(object_const_name)
    object_instance = Kernel.const_get(object_const_name).new
    puts "#{context} Instance: #{object_instance.inspect}"
    object_instance
  end
  
  
  def initialize(object_name, action)
    #puts "object: #{object_name}, action: #{action}"
    @object_name = object_name
    @action = action.to_sym
    @object_context ="Object"
  end
  
  def object_instance
    self.class.find(@object_name)
  end
  
  def action
    @action
  end
  
  def run (*args)
    if args.length < 1
      object_instance.send(@action)  
    else
      object_instance.send(@action,*args)
    end if @action != :none
  end
  
  
end