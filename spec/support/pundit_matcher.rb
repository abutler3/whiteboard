#custom RSpec matchers
# You can chain this permit_action method after should, should_not,
# expect().to, or expect().to_not because it’s been defined as a matcher.
# The action argument is what you pass in when you call the method—such as
# :show in it { should permit _action :show }—and the policy argument is the subject
# of the test itself, in this case the ProjectPolicy instance.
RSpec::Matchers.define :permit_action do |action|
  match do |policy|
    policy.public_send("#{action}?")
  end
  # The public_send("#{action}?") method might look a little bit odd—it’s part of
  # Ruby’s metaprogramming magic. public_send (and its more dangerous brother, send)
  #allow you to pass in a method name as a string, and then that method will be called.

  failure_message do |policy|
    "#{policy.class} does not allow #{policy.user || "nil"} to " + "perform :#{action}? on #{policy.record}."
  end

  failure_message_when_negated do |policy|
    "#{policy.class} does not forbid #{policy.user || "nil"} from " + "performing :#{action}? on #{policy.record}."
  end
end
