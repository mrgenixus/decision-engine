class Decision
  
  
  def self.find_controller(controller_name)
    # require "#{controller_name}_controller"
    controller_whole_name = controller_name.split('_').map {|w| w.capitalize}.join
    controller_const_name = "#{controller_whole_name}Controller"
    raise NameError.new "Constant not found: " unless Kernel.const_defined?(controller_const_name)
    controller = Kernel.const_get(controller_const_name).new
    puts "Controller Name: #{controller_const_name}"
    puts "Instance: #{controller.inspect}"
    controller
  end
  
  
  def initialize(controller_name, action)
    @controller = controller_name
    @action = action.to_sym
  end
  
  def controller
    find_controller(@controller)
  end
  
  def find_controller(controller_name)
    self.class.find_controller("#{controller_name}")
  end
  
  
  def action
    @action
  end
  
  def run
    {}
  end
  
  
end