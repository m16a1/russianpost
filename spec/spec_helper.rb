require 'rspec'
require 'simplecov'

SimpleCov.start do
  add_group 'Libraries', 'lib'
  add_group 'Unit tests', 'spec/unit'
end

require 'russianpost'

RSpec::Matchers.define :have_constant do |const|
  match do |owner|
    (owner.is_a?(Class) ? owner : owner.class).const_defined?(const)
  end
end
