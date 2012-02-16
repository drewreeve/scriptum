RSpec::Matchers.define :have_error_on do |attribute|
  chain :with_message do |message|
    @message = message
  end
  
  match do |model|
    model.valid?
    
    @errors = model.errors.has_key?(attribute)
    
    @message ? @errors && model.errors[attribute].include?(@message) : @errors
  end
  
  failure_message_for_should do |model|
    if @message
      "Validation errors #{model.errors[attribute].inspect} should include #{@message.inspect}"
    else
      "#{model.class} should have errors on attribute #{attribute.inspect}"
    end
  end

  failure_message_for_should_not do |model|
    "#{model.class} should not have an error on attribute #{attribute.inspect}"
  end  
end