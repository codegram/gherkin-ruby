require_relative 'test_helper'
require 'parslet'
require 'pp'

def t(input)
  parser = Gherkin::Parser.new
  result = parser.parse(input)
  transform = Gherkin::Transform.new
  transform.apply(result)
end

module Gherkin
  describe 'Feature parsing' do
    before do
      @scenario = """Feature: My Feature
  Scenario: something happens
    Given something happens
    Then something cooler happens

  Scenario: something else happens
    Given foo
    Then bar
"""
      @result = t(@scenario)
    end

    it 'generates a nice tree' do
      @result.must_be_kind_of AST::Feature

      first_scenario = @result.scenarios.first
      first_scenario.must_be_kind_of AST::Scenario
      first_scenario.name.must_equal 'something happens'
      first_scenario.steps.first.name.must_equal 'something happens'
      first_scenario.steps.last.name.must_equal 'something cooler happens'

      last_scenario = @result.scenarios.last
      last_scenario.must_be_kind_of AST::Scenario
      last_scenario.name.must_equal 'something else happens'
      last_scenario.steps.first.name.must_equal 'foo'
      last_scenario.steps.last.name.must_equal 'bar'
    end
  end
end
